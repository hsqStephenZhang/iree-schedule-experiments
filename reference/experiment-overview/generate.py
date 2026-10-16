"""Build the Markdown/JSON experiment catalog from archived source reports."""
import hashlib
import json
import math
from pathlib import Path
import re
import statistics

OUT=Path(__file__).resolve().parent
ROOT=OUT.parents[1]
load=lambda p:json.loads((ROOT/p).read_text())
VARIANTS=['01_original','02_panel_pack','03_panel_pack_kernel','04_full_pack_kernel']
machines={
 'i5':dict(model='Intel Core i5-14600KF',arch='x86_64',host='root@magic.root',environment='Linux / Manjaro',logical_cpus=20,notes='Hostname rusty; remote run-a/run-b results exactly match local archives.'),
 'ryzen':dict(model='AMD Ryzen 7 5800H',arch='x86_64',host='SSH alias not recorded',environment='Linux container',notes='Separate from magic.root; target haswell, CPU 5; perf blocked by container/host policy.'),
 'm2':dict(model='Apple M2 Pro',arch='aarch64',host='local macOS',environment='macOS 27.0.1',logical_cpus=12,notes='8 performance + 4 efficiency cores; unpinned.'),
 'ci-xeon':dict(model='Intel Xeon Platinum 8573C',arch='x86_64',host='GitHub ubuntu-24.04',environment='GitHub hosted Linux runner',notes='Native target emeraldrapids; baseline may use wider SIMD than custom AVX2 kernels; counters unavailable.'),
 'ci-m1':dict(model='Apple M1 (Virtual)',arch='aarch64',host='GitHub macos-15',environment='GitHub hosted macOS VM',notes='Resolved target generic; unpinned; counters unavailable.'),
 'oracle':dict(model='AMD EPYC 7551',arch='x86_64',host='root@oracle.usa.amd1',environment='Oracle Cloud VM / Ubuntu 22.04',logical_cpus=2,notes='947 MiB RAM; /proc/stat reports ~50% steal with accounting caveat; 4096 deferred by user.'),
 'ss420e':dict(model='Intel Xeon Silver 4310',arch='x86_64',host='sunqi@ss420e',environment='Ubuntu 20.04 / Linux 5.4',logical_cpus=48,notes='2 sockets × 12 cores; ~503 GiB RAM; CPU 0, target icelake-server.'),
 'epyc7662':dict(model='AMD EPYC 7662 64-Core Processor',arch='x86_64',host='user supplied, alias unknown',environment='not supplied',logical_cpus=256,notes='CPU family 23; do not infer socket count, IREE version, affinity, or compiler target.')}
datasets=[];points=[];independent=[];diagnostics=[];pmu=[];sources={}
def register_source(path):
 p=ROOT/path
 if p.exists():sources[path]={'sha256':hashlib.sha256(p.read_bytes()).hexdigest()}
 return path

def add_data(identifier,machine,title,path,data,*,kind='native',notes='',tier='history',derived_from=None,rows=None):
 register_source(path);m=data.get('metadata',{})
 compiler=m.get('compiler','');match=re.search(r'IREE compiler version ([^\s]+)',compiler)
 ds=dict(id=identifier,machine_id=machine,title=title,source=path,kind=kind,tier=tier,notes=notes,
         target_cpu=m.get('resolved_target',{}).get('cpu',m.get('target_cpu')),
         requested_target=m.get('target_cpu'),iree_compiler=match[1] if match else None,
         compiler=compiler,clang=m.get('clang'),rounds=m.get('rounds',m.get('repetitions')),
         min_time=m.get('minimum_time',m.get('min_time')),logical_cpu=m.get('logical_cpu'),
         driver=m.get('driver','local-sync'),dtype=m.get('dtype','float32'),
         weights_mode='dynamic A and B; packing included per invocation',derived_from=derived_from or [])
 if derived_from:
  ds['rounds']=max(r['times_ms']['samples'] for r in rows)
 if kind=='warmed preloaded timing':ds['min_time']='3 GEMMs/window (not native benchmark)'
 datasets.append(ds)
 for r in rows if rows is not None else data['results']:
  times=r.get('times_ms',[])
  stats=times if isinstance(times,dict) else {}
  value=r.get('median_ms',stats.get('median'))
  if value is None and times:value=statistics.median(times)
  assert value and math.isfinite(value) and value>0,(identifier,r)
  if isinstance(times,list) and times:
   assert math.isclose(statistics.median(times),value,rel_tol=1e-10)
  points.append(dict(dataset_id=identifier,machine_id=machine,size=r['size'],variant=r['variant'],
                     time_ms=value,statistic='median',samples_ms=times if isinstance(times,list) else None,
                     batch_stats=stats or None,rounds=len(times) if isinstance(times,list) and times else stats.get('samples',ds['rounds']),
                     max_abs_error=r.get('max_abs_error'),validation=r.get('validation',m.get('validation')),
                     weights_mode=ds['weights_mode'],source=path))
 return ds

def native(identifier,machine,title,path,**kwargs):return add_data(identifier,machine,title,path,load(path),**kwargs)

native('i5-july','i5','历史 July RC','reference/i5-14600kf-alderlake/results.json',notes='IREE 3.12.0rc20260713; adaptive 0.2s batches.')
for run in ['a','b']:
 native('i5-run-'+run,'i5','3.12.0 确认 run-'+run,f'reference/i5-14600kf-alderlake-iree3.12.0-confirmation/run-{run}/results.json',notes='12 batches × 3 GEMMs; run-b reuses identical modules.')
c=load('reference/i5-14600kf-alderlake-iree3.12.0-confirmation/combined.json')
add_data('i5-confirmed','i5','3.12.0 确认，两次合并','reference/i5-14600kf-alderlake-iree3.12.0-confirmation/combined.json',c,rows=c['rows'],tier='main',kind='derived native',derived_from=['i5-run-a','i5-run-b'],notes='24 batches × 3 GEMMs per variant/size; derived union, not a third execution.')
native('m2-generic','m2','NEON 通用 A packing','reference/apple-m2-neon/results.json',tier='main',notes='5 adaptive 0.2s batches; custom 6-row A packing uses generic implementation.')
native('m2-specialized','m2','NEON 专用 A packing','reference/apple-m2-neon-refined/results.json',tier='main',notes='5 adaptive 0.2s batches; only 03/04 use neon_pack_a6; separate configuration.')
native('m2-readme','m2','README 一键复跑','results/readme-check/artifacts/results.json',notes='3 adaptive batches; generic A packing.')
ci=load('results/github-ci-38640699039/summary.json');register_source('results/github-ci-38640699039/summary.json')
for runner,machine in [('ubuntu-24.04','ci-xeon'),('macos-15','ci-m1')]:
 report=ci['reports'][runner]
 add_data('ci-'+runner,machine,'GitHub CI '+runner,'results/github-ci-38640699039/summary.json',report['benchmark'],tier='main',notes='5 batches × 3 GEMMs; run 38640699039. Hardware counters unavailable.')
for identifier,machine,title,path,tier,notes in [
 ('oracle-first','oracle','Oracle 首轮','results/remote-perf-20261016/runners/oracle-usa-amd1/experiment/artifacts/results.json','history','5 batches × 3 GEMMs; complete six-group perf collection.'),
 ('oracle-recheck','oracle','Oracle 12 轮复测','results/remote-perf-20261016/runners/oracle-usa-amd1/recheck/results.json','main','12 batches × 3 GEMMs, rotated/reversed order; same VMFB; timing-only recheck.'),
 ('ss420e-full','ss420e','ss420e 正式实验','results/remote-perf-20261016/runners/ss420e/experiment/artifacts/results.json','main','5 batches × 3 GEMMs; original 158 perf windows + 42 recovered windows; independent timings completed.')]:
 native(identifier,machine,title,path,tier=tier,notes=notes)
c=load('results/remote-perf-20261016/oracle-combined.json')
add_data('oracle-pooled','oracle','Oracle 首轮与复测合并','results/remote-perf-20261016/oracle-combined.json',c,rows=c['rows'],kind='derived native',derived_from=['oracle-first','oracle-recheck'],notes='17 batches per variant; derived union, not another execution.')
# The Ryzen archive contains independent timing, not native benchmark batches.
p='reference/ryzen-5800h-haswell-iree3.12.0-metrics/'
metadata=load(p+'artifact-metadata.json')['source_metadata'];records=load(p+'timing-records.json')
ryzen_rows=[]
for r in load(p+'timing-summary.json'):
 samples=[x['ms_per_gemm'] for x in records if (x['size'],x['variant'])==(r['size'],r['variant'])]
 ryzen_rows.append(dict(r,times_ms=samples))
add_data('ryzen-timing','ryzen','5800H 远端计时',p+'timing-summary.json',dict(metadata=metadata,results=ryzen_rows),kind='warmed preloaded timing',tier='main',notes='5 windows × 3 GEMMs; only 01/02 measured; hardware counters blocked.')
user_path='reference/experiment-overview/epyc-7662-user-report.json';u=load(user_path);register_source(user_path)
datasets.append(dict(id='epyc7662-user',machine_id='epyc7662',title='EPYC 7662 用户实验',source=user_path,kind='user reported',tier='main',rounds=3,min_time=None,target_cpu=None,iree_compiler=None,driver='local-sync',logical_cpu=None,weights_mode=u['weights_mode'],derived_from=[],notes='Reported table only; original JSON, compiler, validation and aggregation method not supplied.'))
for r in u['results']:
 points.append(dict(dataset_id='epyc7662-user',machine_id='epyc7662',size=r['size'],variant=r['variant'],time_ms=r['reported_ms'],statistic=u['statistic'],rounds=3,samples_ms=None,reported_speedup=r['reported_speedup'],weights_mode=u['weights_mode'],source=user_path,validation='not supplied'))
# Smoke/check runs remain visible but are not selected as representative timings.
for identifier,path in [('m2-sanity','results/neon-sanity/results.json'),('m2-zipapp','results/neon-zipapp/results.json'),('m2-fresh-smoke','results/readme-fresh-smoke/artifacts/results.json'),('m2-ci-smoke','results/ci-smoke/experiment/artifacts/results.json')]:
 native(identifier,'m2',identifier,path,tier='smoke',notes='Small-size smoke/entry-point validation; not a main performance conclusion.')
magic_path='reference/experiment-overview/magic-root-results.json';magic=load(magic_path);register_source(magic_path)
for run in ['a','b']:
 assert magic['results'][f'/tmp/iree-gemm-bench-confirmation/run-{run}/results.json']['data']==load(f'reference/i5-14600kf-alderlake-iree3.12.0-confirmation/run-{run}/results.json')
for index,(remote,entry) in enumerate(magic['results'].items()):
 if 'confirmation/run-' in remote or not entry['data'].get('results'):continue
 ds=add_data('magic-check-'+str(index),'i5',Path(remote).parent.name,magic_path,entry['data'],tier='smoke',notes='Existing remote check, not rerun for this catalog; '+remote)
 ds['remote_path']=remote
for name in ['analysis-results','specialized-pack-results']:
 path=f'reference/apple-m2-neon/{name}.json';d=load(path);register_source(path)
 for row in d['cases']:
  diagnostics.append(dict(machine_id='m2',batch=name,size=d['metadata']['size'],name=row['name'],time_ms=row['median_ms'],samples_ms=row['times_ms'],packing_only=row['packing_only'],prepacked_operands=row['operands'],source=path,notes='Packing-only replaces compute; not a GEMM. Prepacked inputs change strides; not an additive phase subtraction.'))
# Preserve all independent timings and counter metrics without substituting them for native timings.
for source,summary in [('results/github-ci-38640699039/summary.json',ci),('results/remote-perf-20261016/summary.json',load('results/remote-perf-20261016/summary.json'))]:
 for r in summary['rows']:
  if 'independent_median_ms' in r:
   independent.append(dict(source=source,runner=r['runner'],machine_model=r['cpu'],size=r['size'],variant=r['variant'],median_ms=r['independent_median_ms'],min_ms=r['independent_min_ms'],max_ms=r['independent_max_ms'],samples_ms=r.get('independent_samples_ms'),iterations=r.get('independent_gemms_per_window'),core_pmu=r['core_pmu']))
 for runner,report in summary['reports'].items():
  for r in report.get('pmu',[]):pmu.append(dict(source=source,runner=runner,**r))
intel_perf='reference/i5-14600kf-alderlake-iree3.12.0-perf/combined.json';perf=load(intel_perf);register_source(intel_perf)
for r in perf['pmu_summary']:pmu.append(dict(source=intel_perf,runner='magic.root / i5-14600KF',**r))
# Recompute all speedups against the same dataset, size and measurement kind.
lookup={(r['dataset_id'],r['size'],r['variant']):r for r in points}
for row in points:
 base=lookup[(row['dataset_id'],row['size'],'01_original')]['time_ms']
 row['speedup_vs_same_run_original']=base/row['time_ms']
 row['gflops']=2*row['size']**3/(row['time_ms']*1e6)
 if 'reported_speedup' in row:assert abs(row['reported_speedup']-row['speedup_vs_same_run_original'])<.006
assert len(machines)==8
assert len(lookup)==len(points),'Duplicate canonical observation'
result=dict(machines=machines,datasets=datasets,measurements=points,independent_timings=independent,diagnostics=diagnostics,pmu=pmu,intel_imc=perf['memory_summary'],sources=sources,
            notes=['All measured archived four-way runs use dynamic A/B. User EPYC 7662 raw artifact semantics are unverified.', 'Constant weights are not covered by the main performance comparisons; see constant-weights.md.', 'Derived pooled datasets repeat source observations and must not be counted as additional executions.', 'M2 reference/local copies and confirmation run-a/run-b remote copies are deduplicated.', 'No GEMV or fixed-weight steady-state timing is present.'])
(OUT/'data.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
def source_link(path):return '['+path+'](../../'+path+')'
def fmt(row):return '—' if row is None else f"{row['time_ms']:.2f} ({row['speedup_vs_same_run_original']:.3f}×)"
def table(ids):
 lines=['| 实验 | CPU 型号 | 尺寸 | Original ms | Panel ms / 加速 | Panel+kernel ms / 加速 | Full+kernel ms / 加速 |','| --- | --- | ---: | ---: | ---: | ---: | ---: |']
 for ds in datasets:
  if ds['id'] not in ids:continue
  for size in sorted({r['size'] for r in points if r['dataset_id']==ds['id']}):
   if size<2048 and ds['tier']!='smoke':continue
   rows=[lookup.get((ds['id'],size,v)) for v in VARIANTS]
   lines.append('| '+' | '.join([ds['id'],machines[ds['machine_id']]['model'],str(size)+'³',f"{rows[0]['time_ms']:.2f}",*(fmt(r) for r in rows[1:])])+' |')
 return lines
lines=['# 全部 GEMM 实验汇总','',
'覆盖 **8 种 CPU 型号**：历史归档、GitHub CI、Oracle / ss420e、magic.root 原始确认运行，以及用户提供的 EPYC 7662 数据。时延单位为毫秒；加速比均以同一实验、同一尺寸的 original 为基线。','',
'**适用范围：本页历史四组主实验中 A/B 都是运行时输入，每次调用包含 packing；不代表固定权重稳态，也未测 GEMV。** 新增的固定 B 三组控制与两条基线另见 [固定权重实验汇总](../fixed-weights/README.md)。EPYC 7662 仅有用户汇总，尚未核验原始 IR。[常量权重分析与编译验证](constant-weights.md)。','',
'## 机器与来源','',
'| ID | 型号 | 主机 / 环境 | 已知配置与限制 |','| --- | --- | --- | --- |']
for key,m in machines.items():lines.append('| '+' | '.join([key,m['model'],m['host']+' / '+m['environment'],m.get('notes','')])+' |')
lines += ['', '**magic.root 与 Ryzen 5800H、EPYC 7662 为不同机器。** magic.root 当前 hostname 为 rusty，CPU 为 i5-14600KF；其远端 run-a/run-b 与本地归档 JSON 完全相同。','',
'## 主要性能结果','',
'下表保留每台机器的主要实验。M2 的通用 A packing 与专用 A packing 分开列出；Oracle 采用额外的 12 轮复测。i5 采用两次 12 轮、合计 24 批的汇总。Ryzen 5800H 只有预加载独立计时，不能当作同口径原生 benchmark；EPYC 7662 是用户汇总值。','']
lines+=table({d['id'] for d in datasets if d['tier']=='main'})
lines += ['', '— 表示没有该项测量。所有归档时延为样本中位数；用户提供的 EPYC 7662 未提供样本、统计方法、IREE 版本和验证记录。','',
'## 每次实验的配置与来源','',
'所有已核验主实验均为 FP32、单线程 local-sync；CPU 总线程数不代表使用多线程。0.2s/0.1s/0.05s 为自适应批时长，不能统一当成每批固定三次。3x 才明确固定为三次。','',
'| 实验 ID | 类型 | LLVM target | 轮数 | 原生 min-time | 固定 CPU | IREE 编译器 | 来源与说明 |','| --- | --- | --- | ---: | --- | --- | --- | --- |']
for d in datasets:
 source=source_link(d['source'])
 lines.append('| '+' | '.join([d['id'],d['kind'],str(d.get('target_cpu') or '未提供'),str(d.get('rounds') or '见样本'),str(d.get('min_time') or '未提供'),str(d.get('logical_cpu')) if d.get('logical_cpu') is not None else '未绑定/未提供',str(d.get('iree_compiler') or '未提供'),source+'；'+d.get('notes','')])+' |')
lines += ['', '## 历史与复测明细','', '下表包含首轮、确认 run-a/run-b、历史编译器、README 复跑及派生合并结果。派生合并不是额外的一次执行，不应与来源样本重复累计。','']
lines+=table({d['id'] for d in datasets if d['tier']=='history'})
lines += ['', '## NEON 诊断实验','',
'均在 Apple M2 Pro、4096³ 上执行，每项 3 轮。prepacked_A / prepacked_AB 在计时前手工打包，改变了寻址 stride；packing_only 用不执行 GEMM 的 sink 替代计算。它们既不是正常动态 GEMM，也不是“仅 B 固定”的模型推理测试。','',
'| 批次 | 配置 | 时延 ms | 预打包输入 | packing-only |','| --- | --- | ---: | --- | --- |']
for d in diagnostics:lines.append(f"| {d['batch']} | {d['name']} | {d['time_ms']:.2f} | {d['prepacked_operands'] or '无'} | {'是，非 GEMM' if d['packing_only'] else '否'} |")
lines += ['', '## 冒烟与兼容检查','', '包含本地 256³ 检查和 magic.root 上已有的 portability / alignment 检查；用于记录执行覆盖，不作为大矩阵性能结论。','']
lines+=table({d['id'] for d in datasets if d['tier']=='smoke'})
lines += ['', '## perf 与测量证据','',
'| 主机 | 核心 PMU | 内存流量 | 说明 |','| --- | --- | --- | --- |',
'| magic.root / i5-14600KF | original/panel，3 轮，60 窗口，无复用 | Intel IMC 已测，系统级、近似背景扣除 | 4096³ LLC miss 与 DRAM 读流量显著下降；只适用于本实验数据 |',
'| Oracle EPYC 7551 | 四组，5 轮、120 窗口，100% running | 未暴露 | /proc/stat 的 ~50% steal 与线程 CPU 时钟存在口径差异；12 轮复测未重新采 PMU |',
'| ss420e Xeon 4310 | 四组双尺寸，5 轮、200 窗口，100% running | 支持的 IMC 未暴露 | SSH 中断后保留 158 窗口，补齐 42；恢复过程单独留档 |',
'| Ryzen 5800H | 被权限/容器策略阻止 | 未采集 | 只有独立计时，不能推导 cache/TLB 原因 |',
'| GitHub CI 两主机 | 不可用 | 不可用 | 保存权限/后端诊断 |',
'| M2 Pro | 未实现 | 未采集 | 诊断依据 IR、汇编和受控改动 |',
'| EPYC 7662 用户实验 | 未提供 | 未提供 | 不填零、不推断 |', '',
'完整计数器数值、事件定义和各组 median/min/max 保存在 [data.json](data.json) 的 pmu/intel_imc 中；原始来源见 sources。不同厂商事件的分母与含义不同，不合并成统一 miss rate。','',
'## 汇总观察与限制','',
'- Panel packing 的收益依赖机器和尺寸。i5 的 4096³ 为 1.66×，2048³ 约持平；EPYC 7662 用户结果为 1.16× / 1.43×；ss420e 为 1.21× / 1.33×；Oracle 2048³ 复测仅约 1.015×。',
'- M2 Pro 与两台 GitHub runner 没有复现上述 panel 收益。M2 专用 A packing 大幅改善了自定义路径，但不能把不同 packing 实现的两次运行混成一组。',
'- 原生 IREE target 可选择不同微内核/指令集，03/04 的自定义内核保持 AVX2 或 NEON；因此跨配置差异包含内核形状、packing、blocking、dispatch、输出生命周期。',
'- **动态 A/B 的结果不能直接用来否定 IREE 对常量权重做全量 packing。** 固定 B 的预打包可在编译或初始化阶段摊销，panel 计算也可以消费持久化预打包 B；新增独立控制实验见 [固定 B 结果](../fixed-weights/README.md)。',
'- 未提供的测试结果、硬件计数器与模型稳态性能均保留为空，不由当前时间表推算。','',
'## 文件','',
'- [data.json](data.json)：全部机器、逐变体测量、原始样本、独立计时、NEON 诊断、PMU、来源哈希；可直接用于后续分析。',
'- [epyc-7662-user-report.json](epyc-7662-user-report.json)：保留用户原始数字及未知配置字段。',
'- [magic-root-results.json](magic-root-results.json)：magic.root 已有实验及硬件快照；确认归档归属的证据。',
'- [constant-weights.md](constant-weights.md)：固定权重适用范围、IREE 源码依据和小型编译验证。','']
(OUT/'README.md').write_text('\n'.join(lines))
print(json.dumps(dict(machines=len(machines),datasets=len(datasets),measurements=len(points),diagnostics=len(diagnostics),pmu_cases=len(pmu),independent_cases=len(independent)),indent=2))
