import UIKit

/*
 题目：输入一个整数数组，实现一个函数来调整该数组中数字的顺序，使得所有奇数位于数组的前半部分，所有偶数位于数组的后半部分。

 示例：
 输入：nums = [1,2,3,4]
 输出：[1,3,2,4]
 注：[3,1,2,4] 也是正确的答案之一。
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

// 双指针
func exchange(_ nums: [Int]) -> [Int] {
    var res = nums
    var left = 0
    var right = res.count - 1
    
    while left <= right {
        if res[left] % 2 == 1 {
            left += 1
        } else {
            res.swapAt(left, right)
            right -= 1
        }
    }
    return res
}
