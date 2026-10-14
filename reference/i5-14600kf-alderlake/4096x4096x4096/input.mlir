module {
  func.func @gemm(%a: tensor<4096x4096xf32>, %b: tensor<4096x4096xf32>) -> tensor<4096x4096xf32> {
    %zero = arith.constant 0.0 : f32
    %empty = tensor.empty() : tensor<4096x4096xf32>
    %init = linalg.fill ins(%zero : f32) outs(%empty : tensor<4096x4096xf32>) -> tensor<4096x4096xf32>
    %c = linalg.matmul ins(%a, %b : tensor<4096x4096xf32>, tensor<4096x4096xf32>) outs(%init : tensor<4096x4096xf32>) -> tensor<4096x4096xf32>
    return %c : tensor<4096x4096xf32>
  }
}
