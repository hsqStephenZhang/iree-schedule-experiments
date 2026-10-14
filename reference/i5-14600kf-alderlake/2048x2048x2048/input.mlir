module {
  func.func @gemm(%a: tensor<2048x2048xf32>, %b: tensor<2048x2048xf32>) -> tensor<2048x2048xf32> {
    %zero = arith.constant 0.0 : f32
    %empty = tensor.empty() : tensor<2048x2048xf32>
    %init = linalg.fill ins(%zero : f32) outs(%empty : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    %c = linalg.matmul ins(%a, %b : tensor<2048x2048xf32>, tensor<2048x2048xf32>) outs(%init : tensor<2048x2048xf32>) -> tensor<2048x2048xf32>
    return %c : tensor<2048x2048xf32>
  }
}
