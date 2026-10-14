#include <immintrin.h>
#include <stdint.h>
__attribute__((always_inline)) static inline void tile(float *restrict c, const float *restrict a, const float *restrict b, int64_t kt, int acc) {
__m256 x0_0 = acc ? _mm256_loadu_ps(c+0) : _mm256_setzero_ps();
__m256 x0_1 = acc ? _mm256_loadu_ps(c+8) : _mm256_setzero_ps();
__m256 x1_0 = acc ? _mm256_loadu_ps(c+16) : _mm256_setzero_ps();
__m256 x1_1 = acc ? _mm256_loadu_ps(c+24) : _mm256_setzero_ps();
__m256 x2_0 = acc ? _mm256_loadu_ps(c+32) : _mm256_setzero_ps();
__m256 x2_1 = acc ? _mm256_loadu_ps(c+40) : _mm256_setzero_ps();
__m256 x3_0 = acc ? _mm256_loadu_ps(c+48) : _mm256_setzero_ps();
__m256 x3_1 = acc ? _mm256_loadu_ps(c+56) : _mm256_setzero_ps();
__m256 x4_0 = acc ? _mm256_loadu_ps(c+64) : _mm256_setzero_ps();
__m256 x4_1 = acc ? _mm256_loadu_ps(c+72) : _mm256_setzero_ps();
__m256 x5_0 = acc ? _mm256_loadu_ps(c+80) : _mm256_setzero_ps();
__m256 x5_1 = acc ? _mm256_loadu_ps(c+88) : _mm256_setzero_ps();
for(int64_t k=0;k<kt;++k) {
{
__m256 bv0 = _mm256_loadu_ps(b+0);
__m256 bv1 = _mm256_loadu_ps(b+8);
__m256 av0 = _mm256_broadcast_ss(a+0);
x0_0 = _mm256_fmadd_ps(av0,bv0,x0_0);
x0_1 = _mm256_fmadd_ps(av0,bv1,x0_1);
__m256 av1 = _mm256_broadcast_ss(a+1);
x1_0 = _mm256_fmadd_ps(av1,bv0,x1_0);
x1_1 = _mm256_fmadd_ps(av1,bv1,x1_1);
__m256 av2 = _mm256_broadcast_ss(a+2);
x2_0 = _mm256_fmadd_ps(av2,bv0,x2_0);
x2_1 = _mm256_fmadd_ps(av2,bv1,x2_1);
__m256 av3 = _mm256_broadcast_ss(a+3);
x3_0 = _mm256_fmadd_ps(av3,bv0,x3_0);
x3_1 = _mm256_fmadd_ps(av3,bv1,x3_1);
__m256 av4 = _mm256_broadcast_ss(a+4);
x4_0 = _mm256_fmadd_ps(av4,bv0,x4_0);
x4_1 = _mm256_fmadd_ps(av4,bv1,x4_1);
__m256 av5 = _mm256_broadcast_ss(a+5);
x5_0 = _mm256_fmadd_ps(av5,bv0,x5_0);
x5_1 = _mm256_fmadd_ps(av5,bv1,x5_1);
}
{
__m256 bv0 = _mm256_loadu_ps(b+16);
__m256 bv1 = _mm256_loadu_ps(b+24);
__m256 av0 = _mm256_broadcast_ss(a+6);
x0_0 = _mm256_fmadd_ps(av0,bv0,x0_0);
x0_1 = _mm256_fmadd_ps(av0,bv1,x0_1);
__m256 av1 = _mm256_broadcast_ss(a+7);
x1_0 = _mm256_fmadd_ps(av1,bv0,x1_0);
x1_1 = _mm256_fmadd_ps(av1,bv1,x1_1);
__m256 av2 = _mm256_broadcast_ss(a+8);
x2_0 = _mm256_fmadd_ps(av2,bv0,x2_0);
x2_1 = _mm256_fmadd_ps(av2,bv1,x2_1);
__m256 av3 = _mm256_broadcast_ss(a+9);
x3_0 = _mm256_fmadd_ps(av3,bv0,x3_0);
x3_1 = _mm256_fmadd_ps(av3,bv1,x3_1);
__m256 av4 = _mm256_broadcast_ss(a+10);
x4_0 = _mm256_fmadd_ps(av4,bv0,x4_0);
x4_1 = _mm256_fmadd_ps(av4,bv1,x4_1);
__m256 av5 = _mm256_broadcast_ss(a+11);
x5_0 = _mm256_fmadd_ps(av5,bv0,x5_0);
x5_1 = _mm256_fmadd_ps(av5,bv1,x5_1);
}
{
__m256 bv0 = _mm256_loadu_ps(b+32);
__m256 bv1 = _mm256_loadu_ps(b+40);
__m256 av0 = _mm256_broadcast_ss(a+12);
x0_0 = _mm256_fmadd_ps(av0,bv0,x0_0);
x0_1 = _mm256_fmadd_ps(av0,bv1,x0_1);
__m256 av1 = _mm256_broadcast_ss(a+13);
x1_0 = _mm256_fmadd_ps(av1,bv0,x1_0);
x1_1 = _mm256_fmadd_ps(av1,bv1,x1_1);
__m256 av2 = _mm256_broadcast_ss(a+14);
x2_0 = _mm256_fmadd_ps(av2,bv0,x2_0);
x2_1 = _mm256_fmadd_ps(av2,bv1,x2_1);
__m256 av3 = _mm256_broadcast_ss(a+15);
x3_0 = _mm256_fmadd_ps(av3,bv0,x3_0);
x3_1 = _mm256_fmadd_ps(av3,bv1,x3_1);
__m256 av4 = _mm256_broadcast_ss(a+16);
x4_0 = _mm256_fmadd_ps(av4,bv0,x4_0);
x4_1 = _mm256_fmadd_ps(av4,bv1,x4_1);
__m256 av5 = _mm256_broadcast_ss(a+17);
x5_0 = _mm256_fmadd_ps(av5,bv0,x5_0);
x5_1 = _mm256_fmadd_ps(av5,bv1,x5_1);
}
{
__m256 bv0 = _mm256_loadu_ps(b+48);
__m256 bv1 = _mm256_loadu_ps(b+56);
__m256 av0 = _mm256_broadcast_ss(a+18);
x0_0 = _mm256_fmadd_ps(av0,bv0,x0_0);
x0_1 = _mm256_fmadd_ps(av0,bv1,x0_1);
__m256 av1 = _mm256_broadcast_ss(a+19);
x1_0 = _mm256_fmadd_ps(av1,bv0,x1_0);
x1_1 = _mm256_fmadd_ps(av1,bv1,x1_1);
__m256 av2 = _mm256_broadcast_ss(a+20);
x2_0 = _mm256_fmadd_ps(av2,bv0,x2_0);
x2_1 = _mm256_fmadd_ps(av2,bv1,x2_1);
__m256 av3 = _mm256_broadcast_ss(a+21);
x3_0 = _mm256_fmadd_ps(av3,bv0,x3_0);
x3_1 = _mm256_fmadd_ps(av3,bv1,x3_1);
__m256 av4 = _mm256_broadcast_ss(a+22);
x4_0 = _mm256_fmadd_ps(av4,bv0,x4_0);
x4_1 = _mm256_fmadd_ps(av4,bv1,x4_1);
__m256 av5 = _mm256_broadcast_ss(a+23);
x5_0 = _mm256_fmadd_ps(av5,bv0,x5_0);
x5_1 = _mm256_fmadd_ps(av5,bv1,x5_1);
}
{
__m256 bv0 = _mm256_loadu_ps(b+64);
__m256 bv1 = _mm256_loadu_ps(b+72);
__m256 av0 = _mm256_broadcast_ss(a+24);
x0_0 = _mm256_fmadd_ps(av0,bv0,x0_0);
x0_1 = _mm256_fmadd_ps(av0,bv1,x0_1);
__m256 av1 = _mm256_broadcast_ss(a+25);
x1_0 = _mm256_fmadd_ps(av1,bv0,x1_0);
x1_1 = _mm256_fmadd_ps(av1,bv1,x1_1);
__m256 av2 = _mm256_broadcast_ss(a+26);
x2_0 = _mm256_fmadd_ps(av2,bv0,x2_0);
x2_1 = _mm256_fmadd_ps(av2,bv1,x2_1);
__m256 av3 = _mm256_broadcast_ss(a+27);
x3_0 = _mm256_fmadd_ps(av3,bv0,x3_0);
x3_1 = _mm256_fmadd_ps(av3,bv1,x3_1);
__m256 av4 = _mm256_broadcast_ss(a+28);
x4_0 = _mm256_fmadd_ps(av4,bv0,x4_0);
x4_1 = _mm256_fmadd_ps(av4,bv1,x4_1);
__m256 av5 = _mm256_broadcast_ss(a+29);
x5_0 = _mm256_fmadd_ps(av5,bv0,x5_0);
x5_1 = _mm256_fmadd_ps(av5,bv1,x5_1);
}
{
__m256 bv0 = _mm256_loadu_ps(b+80);
__m256 bv1 = _mm256_loadu_ps(b+88);
__m256 av0 = _mm256_broadcast_ss(a+30);
x0_0 = _mm256_fmadd_ps(av0,bv0,x0_0);
x0_1 = _mm256_fmadd_ps(av0,bv1,x0_1);
__m256 av1 = _mm256_broadcast_ss(a+31);
x1_0 = _mm256_fmadd_ps(av1,bv0,x1_0);
x1_1 = _mm256_fmadd_ps(av1,bv1,x1_1);
__m256 av2 = _mm256_broadcast_ss(a+32);
x2_0 = _mm256_fmadd_ps(av2,bv0,x2_0);
x2_1 = _mm256_fmadd_ps(av2,bv1,x2_1);
__m256 av3 = _mm256_broadcast_ss(a+33);
x3_0 = _mm256_fmadd_ps(av3,bv0,x3_0);
x3_1 = _mm256_fmadd_ps(av3,bv1,x3_1);
__m256 av4 = _mm256_broadcast_ss(a+34);
x4_0 = _mm256_fmadd_ps(av4,bv0,x4_0);
x4_1 = _mm256_fmadd_ps(av4,bv1,x4_1);
__m256 av5 = _mm256_broadcast_ss(a+35);
x5_0 = _mm256_fmadd_ps(av5,bv0,x5_0);
x5_1 = _mm256_fmadd_ps(av5,bv1,x5_1);
}
{
__m256 bv0 = _mm256_loadu_ps(b+96);
__m256 bv1 = _mm256_loadu_ps(b+104);
__m256 av0 = _mm256_broadcast_ss(a+36);
x0_0 = _mm256_fmadd_ps(av0,bv0,x0_0);
x0_1 = _mm256_fmadd_ps(av0,bv1,x0_1);
__m256 av1 = _mm256_broadcast_ss(a+37);
x1_0 = _mm256_fmadd_ps(av1,bv0,x1_0);
x1_1 = _mm256_fmadd_ps(av1,bv1,x1_1);
__m256 av2 = _mm256_broadcast_ss(a+38);
x2_0 = _mm256_fmadd_ps(av2,bv0,x2_0);
x2_1 = _mm256_fmadd_ps(av2,bv1,x2_1);
__m256 av3 = _mm256_broadcast_ss(a+39);
x3_0 = _mm256_fmadd_ps(av3,bv0,x3_0);
x3_1 = _mm256_fmadd_ps(av3,bv1,x3_1);
__m256 av4 = _mm256_broadcast_ss(a+40);
x4_0 = _mm256_fmadd_ps(av4,bv0,x4_0);
x4_1 = _mm256_fmadd_ps(av4,bv1,x4_1);
__m256 av5 = _mm256_broadcast_ss(a+41);
x5_0 = _mm256_fmadd_ps(av5,bv0,x5_0);
x5_1 = _mm256_fmadd_ps(av5,bv1,x5_1);
}
{
__m256 bv0 = _mm256_loadu_ps(b+112);
__m256 bv1 = _mm256_loadu_ps(b+120);
__m256 av0 = _mm256_broadcast_ss(a+42);
x0_0 = _mm256_fmadd_ps(av0,bv0,x0_0);
x0_1 = _mm256_fmadd_ps(av0,bv1,x0_1);
__m256 av1 = _mm256_broadcast_ss(a+43);
x1_0 = _mm256_fmadd_ps(av1,bv0,x1_0);
x1_1 = _mm256_fmadd_ps(av1,bv1,x1_1);
__m256 av2 = _mm256_broadcast_ss(a+44);
x2_0 = _mm256_fmadd_ps(av2,bv0,x2_0);
x2_1 = _mm256_fmadd_ps(av2,bv1,x2_1);
__m256 av3 = _mm256_broadcast_ss(a+45);
x3_0 = _mm256_fmadd_ps(av3,bv0,x3_0);
x3_1 = _mm256_fmadd_ps(av3,bv1,x3_1);
__m256 av4 = _mm256_broadcast_ss(a+46);
x4_0 = _mm256_fmadd_ps(av4,bv0,x4_0);
x4_1 = _mm256_fmadd_ps(av4,bv1,x4_1);
__m256 av5 = _mm256_broadcast_ss(a+47);
x5_0 = _mm256_fmadd_ps(av5,bv0,x5_0);
x5_1 = _mm256_fmadd_ps(av5,bv1,x5_1);
}
a+=48; b+=128;
}
_mm256_storeu_ps(c+0,x0_0);
_mm256_storeu_ps(c+8,x0_1);
_mm256_storeu_ps(c+16,x1_0);
_mm256_storeu_ps(c+24,x1_1);
_mm256_storeu_ps(c+32,x2_0);
_mm256_storeu_ps(c+40,x2_1);
_mm256_storeu_ps(c+48,x3_0);
_mm256_storeu_ps(c+56,x3_1);
_mm256_storeu_ps(c+64,x4_0);
_mm256_storeu_ps(c+72,x4_1);
_mm256_storeu_ps(c+80,x5_0);
_mm256_storeu_ps(c+88,x5_1);
}
int32_t custom_mmt4d_6x16x8(const float *a,int64_t ao,int64_t astride,const float *b,int64_t bo,int64_t bstride,float *c,int64_t co,int64_t cstride,int64_t mt,int64_t nt,int64_t kt,int32_t mr,int32_t nr,int32_t kr,int32_t flags,const void *cpu) {
 for(int64_t m=0;m<mt;++m)
  for(int64_t n=0;n<nt;++n)
   tile(c+co+m*cstride+n*96,a+ao+m*astride,b+bo+n*bstride,kt,flags&256);
 return 0;
}
