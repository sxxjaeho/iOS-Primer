import UIKit

/*
 题目：给定一个整数数组 nums，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

// DP状态定义：
// DP[i]:到i的子数组的最大和

// DP方程：
// DP[i] = max(DP[i-1] + num[i], num[i])

func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.first!
    }
    var dp = [Int](repeating: 0, count: nums.count)
    dp[0] = nums[0]
    var sum = dp[0]
    for i in 1..<nums.count {
        dp[i] = max(dp[i-1] + nums[i], nums[i]);
        sum = max(dp[i], sum)
        // [-2, 1, -3, 4, -1, 2, 1, -5, 4]
        
        // [-2, 1, 0, 0, 0, 0, 0, 0, 0]
        // [-2, 1, -2, 0, 0, 0, 0, 0, 0]
        // [-2, 1, -2, 4, 0, 0, 0, 0, 0]
        // [-2, 1, -2, 4, 3, 0, 0, 0, 0]
        // [-2, 1, -2, 4, 3, 5, 0, 0, 0]
        // [-2, 1, -2, 4, 3, 5, 6, 0, 0]
        // [-2, 1, -2, 4, 3, 5, 6, 1, 0]
        // [-2, 1, -2, 4, 3, 5, 6, 1, 5]
    }
    return sum
}

print(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
