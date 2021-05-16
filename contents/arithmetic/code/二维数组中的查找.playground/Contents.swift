import UIKit

/*
 题目：在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
 
 时间复杂度：O(mn) 空间复杂度：O(1)
 */

func find(_ matrix: [[Int]], _ num: Int) -> Bool {
    var row = 0
    var column = matrix.count - 1
    while column <= matrix[0].count - 1 && row >= 0 {
        if matrix[row][column] > num {
            column -= 1
        } else if matrix[row][column] < num {
            row += 1
        } else {
            return true
        }
    }
    return false
}

let nums = [[1, 2, 8, 9], [2, 4, 9 , 12], [4, 7, 10, 13], [6, 8, 11, 15]]
print(find(nums, 7))
