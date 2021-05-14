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
        let mid = left + (right - left) / 2
        if mid*mid <= x {
            result = mid
            left += 1
        } else {
            right = mid - 1
        }
    }
    return result
}
