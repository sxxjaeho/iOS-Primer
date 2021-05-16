import UIKit

/*
 题目：输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字。
 
 示例：
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 
 时间复杂度：O(mn)，其中 m 和 n 分别是输入矩阵的行数和列数。矩阵中的每个元素都要被访问一次。
 空间复杂度：O(1)。除了输出数组以外，空间复杂度是常数。
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard matrix.count != 0 else {
        return []
    }
    
    var left = 0
    var top = 0
    var right = matrix[top].count - 1
    var bottom = matrix.count - 1
    var result = [Int]()
    
    while true {
        // 第一步
        if right < left { break }
        for i in (left...right) {
            result.append(matrix[top][i])
        }
        top += 1
        
        // 第二步:bottom > top
        if top > bottom { break }
        for i in (top...bottom) {
            result.append(matrix[i][right])
        }
        right -= 1
        
        // 第三步:left > right
        if right < left { break }
        for i in (left...right).reversed() {
            result.append(matrix[bottom][i])
        }
        bottom -= 1
        
        // 第四步:bottom > top + 2
        if top > bottom { break }
        for i in (top...bottom).reversed() {
            result.append(matrix[i][left])
        }
        left += 1
    }
    return result
}

print(spiralOrder([[1,2,3], [4,5,6], [7,8,9]]))
