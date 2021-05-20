import UIKit

/*
 题目：给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。
 
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 
 时间复杂度：O(mn) 空间复杂度：O(1)
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    guard !matrix.isEmpty && matrix.count > 0 && matrix[0].count > 0 else { return [] }
    
    var res = [Int]()
    var left = 0, right = matrix[0].count - 1, top = 0, bottom = matrix.count - 1
    
    while left <= right && top <= bottom {
        for column in left...right {
            res.append(matrix[top][column])
        }
        if top + 1 <= bottom {
            for row in top + 1...bottom {
                res.append(matrix[row][right])
            }
        }
        if left <= right - 1 && top < bottom   {
            for colunm in (left...right - 1).reversed() {
                res.append(matrix[bottom][colunm])
            }
            if top + 1 <= bottom - 1 {
                for row in (top + 1...bottom - 1).reversed() {
                    res.append(matrix[row][left])
                }
            }
        }
        left += 1
        right -= 1
        top += 1
        bottom -= 1
    }
    return res
}

//(top,left)           (top,right)         //上 (top,left)...(top,right)
//    1          2          3              //右 (top+1,right)...(bottm,right)
//    4          5          6              //下 (bottom,right-1)...(bottm,left+1)
//    7          8          9              //左 (bottom,left)...(top+1,left)
//(bottom,left)        (bottom,right)
