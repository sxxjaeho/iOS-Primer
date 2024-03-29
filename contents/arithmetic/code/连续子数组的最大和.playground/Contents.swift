import UIKit

/*
 题目：输入一个整型数组，数组中的一个或连续多个整数组成一个子数组。求所有子数组的和的最大值。

 要求时间复杂度为O(n)。

 示例:
 输入: nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

// DP状态定义:
// DP[i],从第1个数到i的连续子数组最大和

// DP方程:
// DP[i-1]  > 0 -> DP[i] = num[i] + DP[i-1]
//         <= 0 -> DP[i] = num[i]

func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var dp = nums
    var maxSum = nums[0]
    for i in 1..<nums.count {
        // [-2, 1, -3, 4, -1, 2, 1, -5, 4]
        // [-2, 1, -2, 4, -1, 2, 1, -5, 4]
        // [-2, 1, -2, 4, -1, 2, 1, -5, 4]
        // [-2, 1, -2, 4, 3, 2, 1, -5, 4]
        // [-2, 1, -2, 4, 3, 5, 1, -5, 4]
        // [-2, 1, -2, 4, 3, 5, 6, -5, 4]
        // [-2, 1, -2, 4, 3, 5, 6, 1, 4]
        // [-2, 1, -2, 4, 3, 5, 6, 1, 5]
        dp[i] = max(dp[i-1], 0) + nums[i]
        maxSum = max(maxSum, dp[i])
    }
    return maxSum
}

print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))

