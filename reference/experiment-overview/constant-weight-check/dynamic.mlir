module {
  func.func @gemm(%a: tensor<32x64xf32>, %b: tensor<64x64xf32>) -> tensor<32x64xf32> {
    %zero = arith.constant 0.0 : f32
    %empty = tensor.empty() : tensor<32x64xf32>
    %init = linalg.fill ins(%zero : f32) outs(%empty : tensor<32x64xf32>) -> tensor<32x64xf32>
    %c = linalg.matmul ins(%a, %b : tensor<32x64xf32>, tensor<64x64xf32>) outs(%init : tensor<32x64xf32>) -> tensor<32x64xf32>
    return %c : tensor<32x64xf32>
  }
}
