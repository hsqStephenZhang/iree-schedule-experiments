// Diagnostic specialization for IREE's row-major six-row A micropanels.
// Uses vector loads and a 4x4 transpose, as in conventional NEON packers.
// This preserves the existing layout and zero-padded M tail exactly.
#include <arm_neon.h>
#include <stdint.h>

int32_t neon_pack_a6(const float *in, int64_t in_offset,
                    int64_t in_stride0, int64_t in_stride1,
                    float *out, int64_t out_offset,
                    int64_t out_stride0, int64_t out_stride1,
                    int64_t rows, int64_t cols,
                    int64_t out_rows, int64_t out_cols,
                    int64_t tile0, int64_t tile1,
                    int64_t padding, int32_t flags, const void *cpu) {
  if (in_stride1 != 1 || out_stride1 != 6 || cols % 4 ||
      out_rows != (rows + 5) / 6 || out_cols != cols ||
      tile0 != 1 || tile1 != 6 || padding != 0 || flags != 257)
    return 1;
  for (int64_t m = 0; m < out_rows; ++m) {
    for (int64_t k = 0; k < cols; k += 4) {
      float32x4_t r[6];
      for (int i = 0; i < 6; ++i)
        r[i] = m * 6 + i < rows
                   ? vld1q_f32(in + in_offset + (m * 6 + i) * in_stride0 + k)
                   : vdupq_n_f32(0.0f);
      float32x4_t t0 = vtrn1q_f32(r[0], r[1]);
      float32x4_t t1 = vtrn2q_f32(r[0], r[1]);
      float32x4_t t2 = vtrn1q_f32(r[2], r[3]);
      float32x4_t t3 = vtrn2q_f32(r[2], r[3]);
      float32x4_t t4 = vtrn1q_f32(r[4], r[5]);
      float32x4_t t5 = vtrn2q_f32(r[4], r[5]);
      float *dst = out + out_offset + m * out_stride0 + k * out_stride1;
      vst1q_f32(dst, vcombine_f32(vget_low_f32(t0), vget_low_f32(t2)));
      vst1_f32(dst + 4, vget_low_f32(t4));
      vst1q_f32(dst + 6, vcombine_f32(vget_low_f32(t1), vget_low_f32(t3)));
      vst1_f32(dst + 10, vget_low_f32(t5));
      vst1q_f32(dst + 12, vcombine_f32(vget_high_f32(t0), vget_high_f32(t2)));
      vst1_f32(dst + 16, vget_high_f32(t4));
      vst1q_f32(dst + 18, vcombine_f32(vget_high_f32(t1), vget_high_f32(t3)));
      vst1_f32(dst + 22, vget_high_f32(t5));
    }
  }
  return 0;
}
