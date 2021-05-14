import UIKit

/*
 题目：给定两个字符串 text1 和 text2，返回这两个字符串的最长 公共子序列 的长度。如果不存在 公共子序列 ，返回 0 。
 
 一个字符串的 子序列 是指这样一个新的字符串：它是由原字符串在不改变字符的相对顺序的情况下删除某些字符（也可以不删除任何字符）后组成的新字符串。
 
 例如，"ace" 是 "abcde" 的子序列，但 "aec" 不是 "abcde" 的子序列。
 两个字符串的 公共子序列 是这两个字符串所共同拥有的子序列。
 
 示例：
 输入：text1 = "abcde", text2 = "ace"
 输出：3
 解释：最长公共子序列是 "ace" ，它的长度为 3 。
 
 时间复杂度：O(N x M) 空间复杂度：O(N x M)
 */

// dp[i][j] = 最长公共子序列长度
// dp[i][j] = i  = j, dp[i-1][j-1] + 1
//            i != j, max(dp[i-1][j], dp[i][j-1])

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let chars1 = Array(text1)
    let chars2 = Array(text2)
    let m = chars1.count
    let n = chars2.count
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
    var maxLen = 0
    for i in (1...chars1.count) {
        for j in (1...chars2.count) {
            if chars1[i-1] == chars2[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
                maxLen = max(dp[i][j], maxLen)
            } else {
                dp[i][j] = 0
            }
        }
    }
    return maxLen
}

print(longestCommonSubsequence("abcde", "ace"))
