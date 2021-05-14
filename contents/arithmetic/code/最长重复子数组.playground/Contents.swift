import UIKit

/*
 题目：给两个整数数组 A 和 B ，返回两个数组中公共的、长度最长的子数组的长度。
 
 示例：

 输入：
 A: [1,2,3,2,1]
 B: [3,2,1,4,7]
 输出：3
 解释：
 长度最长的公共子数组是 [3, 2, 1] 。
 
 时间复杂度：O(N x M)
 空间复杂度：O(N x M)
 */

// DP状态的定义:
// DP[i][j] = 最长的公共子数组长度

// DP方程:
// DP[i][j] = i  = j, DP[i-1][j-1] + 1
//            i != j, 0

func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: nums2.count+1), count: nums1.count+1)
    var ans = 0
    for i in 1...nums1.count {
        for j in 1...nums2.count {
            if nums1[i-1] == nums2[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
                ans = max(dp[i][j], ans)
            } else {
                dp[i][j] = 0
            }
        }
    }
    return ans
}

print(findLength([1, 2, 3, 2, 1], [3, 2, 1, 4, 7]));

//    0  1  2  3  2  1
// 0  0  0  0  0  0  0
// 3  0  0  0  1  0  0
// 2  0  0  1  0  2  0
// 1  0  1  0  0  0  3
// 4  0  0  0  0  0  0
// 7  0  0  0  0  0  0
