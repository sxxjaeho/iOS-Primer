import UIKit

/*
 题目：给定一个未经排序的整数数组，找到最长且连续递增的子序列，并返回该序列的长度。

 连续递增的子序列 可以由两个下标 l 和 r（l < r）确定，如果对于每个 l <= i < r，都有 nums[i] < nums[i + 1]，那么子序列 [nums[l], nums[l + 1], ..., nums[r - 1], nums[r]] 就是连续递增子序列。

 示例：
 输入：nums = [1,3,5,4,7]
 输出：3
 解释：最长连续递增序列是 [1,3,5], 长度为3。
 尽管 [1,3,5,7] 也是升序的子序列, 但它不是连续的，因为 5 和 7 在原数组里被 4 隔开。
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

// DP状态的定义:
// DP(n):到第n个数的最长连续递增序列个数

// DP方程:
// if (nums[n-1] < num[n]) {
//    DP(n) = DP(n-1) + 1
// }

func findLengthOfLCIS(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var len = 1;
    var dp = Array(repeating: 1, count: nums.count)
    // dp = [1, 1, 1, 1, 1]
    for i in 1..<nums.count {
        if nums[i-1] < nums[i] {
            // dp = [1, 2, 1, 1, 1]
            // dp = [1, 2, 3, 1, 1]
            // dp = [1, 2, 3, 1, 2]
            dp[i] = dp[i-1] + 1
        }
        len = max(dp[i], len)
    }
    return len
}

print(findLengthOfLCIS([1, 3, 5, 4, 7]))
