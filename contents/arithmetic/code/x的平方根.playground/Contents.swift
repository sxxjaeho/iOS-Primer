import UIKit

/*
 题目：实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例：
 输入：4
 输出：2
 
 时间复杂度：O(logx) 空间复杂度：O(1)
 */

// 二分法
func mySqrt(_ x: Int) -> Int {
    var left = 0, right = x, result = 0
    while left <= right {
        // 1.mid: 3
        // 2.mid: 1
        // 3.mid: 1
        // 4.mid: 2
        let mid = left + (right - left) / 2
        print("mid:\(mid)")
        if mid*mid <= x {
            // 2.result: 1 left: 1
            // 3.result: 1 left: 2
            // 3.result: 2 left: 3
            result = mid
            left += 1
            print("resutl:\(result)\(left)")
        } else {
            // 1.right: 2
            right = mid - 1
            print("right:\(right)")
        }
    }
    return result
}

print(mySqrt(6))
