"""Serialize the inspected IR and validate two different A inputs per case."""
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
os.environ['OPENBLAS_NUM_THREADS']='1'
import numpy as np
import iree.runtime as rt
from iree.compiler.tools.binaries import find_tool
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
OUT=ROOT/'results/constant-weight-check'
OUT.mkdir(exist_ok=True)
compile_exe=find_tool('iree-compile')
b=np.random.default_rng(42).normal(size=(64,64)).astype(np.float32)
config=rt.Config('local-sync')
reports=[]
for name in ['dynamic','constant-b','constant-b-no-consteval','constant-b-early-materialized']:
    source=HERE/(name+'-compiled.mlir')
    vmfb=OUT/(name+'.vmfb')
    command=[compile_exe,str(source),'--iree-hal-target-backends=llvm-cpu','--iree-llvmcpu-target-cpu=host','--iree-llvmcpu-enable-ukernels=all','--compile-from=executable-configurations','-o',str(vmfb)]
    subprocess.run(command,check=True,capture_output=True,text=True)
    module=rt.VmModule.mmap(config.vm_instance,str(vmfb));context=rt.SystemContext(config=config);context.add_vm_module(module)
    errors=[]
    for seed in [17,29]:
        a=np.random.default_rng(seed).normal(size=(32,64)).astype(np.float32)
        expected=a.astype(np.float64)@b.astype(np.float64)
        actual=context.modules.module.gemm(*([a,b] if name=='dynamic' else [a])).to_host()
        np.testing.assert_allclose(actual,expected,rtol=1e-3,atol=1e-3)
        errors.append(float(np.max(np.abs(actual-expected))))
    s=source.read_text();public=s[s.index('  util.func public @gemm('):]
    initializer=''
    if '  util.initializer {' in s:
        start=s.index('  util.initializer {');pos=s.index('{',start);depth=0
        for i in range(pos,len(s)):
            depth+= (s[i]=='{')-(s[i]=='}')
            if depth==0:initializer=s[start:i+1];break
    record=dict(case=name,shape=dict(M=32,K=64,N=64),validation='two distinct dynamic A inputs in one context; float64 reference, rtol=atol=1e-3',max_abs_errors=errors,
                runtime_gemm_dispatches=public.count('stream.cmd.dispatch '),initializer_dispatches=initializer.count('stream.cmd.dispatch '),
                initializer_execute_once='stream.cmd.execute once' in initializer,pack_ops_in_module=s.count('linalg.pack '),
                compiled_ir_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),command=command)
    if name=='dynamic':assert record['runtime_gemm_dispatches']==3 and record['initializer_dispatches']==0
    elif name=='constant-b-early-materialized':assert record['initializer_dispatches']==0 and record['pack_ops_in_module']==1
    else:assert record['runtime_gemm_dispatches']==2 and record['initializer_dispatches']==1 and record['initializer_execute_once']
    reports.append(record)
result=dict(compiler=subprocess.check_output([compile_exe,'--version'],text=True),python=sys.version,device='local-sync',weights_b_sha256=hashlib.sha256(b.tobytes()).hexdigest(),cases=reports,note='IR/correctness check only; no GEMM performance or GEMV measurements were made.')
(HERE/'verification.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps([{k:v for k,v in r.items() if k not in ['command','compiled_ir_sha256']} for r in reports],indent=2))
