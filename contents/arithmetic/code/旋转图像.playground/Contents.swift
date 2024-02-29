import UIKit

/*
 题目：给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
 
 你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
 
 示例：
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[[7,4,1],[8,5,2],[9,6,3]]
 */

// 时间复杂度：O(n²) 空间复杂度：O(n²)
func rotate(_ matrix: inout [[Int]]) {
    let n = matrix.count
    if n <= 1 {
        return
    }
    let temp = matrix
    for i in 0..<n {
        for j in 0..<n {
            matrix[i][j] = temp[n-j-1][i]
        }
    }
}

// 时间复杂度：O(n²) 空间复杂度：O(1)
func rotate1(_ matrix: inout [[Int]]) {
    let n = matrix.count
    if n <= 1 {
        return
    }
    
    // 水平翻转
    for i in 0..<n/2 {
        for j in 0..<n {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[n-i-1][j]
            matrix[n-i-1][j] = temp
        }
    }
    
    // 对角线翻转
    for i in 0..<n {
        for j in 0..<i {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
        }
    }
}

var matrix = [[1,2,3],[4,5,6],[7,8,9]]
rotate(&matrix)
print(matrix)
