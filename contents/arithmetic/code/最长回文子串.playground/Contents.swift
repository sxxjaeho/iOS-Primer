import UIKit

/*
 题目：给你一个字符串 s，找到 s 中最长的回文子串。
 
 示例：
 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 
 时间复杂度：O(n²) 空间复杂度：O(n²)
 */

// dp[i][j] 表示 i...j是否为回文子串

// dp[i][j] = s[i] == s[j]
//                   j-1 - (i+1) + 1 < 2 = true
//                                       = dp[i+1][j-1]
//            s[i] != s[j] = false
func longestPalindrome(_ s: String) -> String {
    if s.count < 2  {
        return s
    }
    let s = Array(s)
    var dp = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
    var start = 0
    var maxLen = 0
    for j in 0..<s.count {
        for i in 0...j {
            if s[j] == s[i] {
                if j-1 - (i+1) + 1 < 2 {
                    dp[i][j] = true
                } else {
                    dp[i][j] = dp[i+1][j-1]
                }
                if j - i + 1 > maxLen && dp[i][j] {
                    start = i
                    maxLen = j - i + 1
                }
            } else {
                dp[i][j] = false
            }
        }
    }
    return String(s[start..<start+maxLen])
}
print(longestPalindrome("aaaa"))

//i\j  b   a   b   a   d
// b   1   0   1   0   0
// a       1   0   1   0
// b           1   0   0
// a               1   0
// d                   1


//     a  a  c  a  b  d  k  a  c  a  a
// a   1  1  0  0  0  0  0  0  0  0  0
// a      1  0  1  0  0  0  0  0  0  0
// c         1  0  0  0  0  0  0  0  0
// a            1  0  0  0  0  0  0  0
// b               1  0  0  0  0  0  0
// d                  1  0  0  0  0  0
// k                     1  0  0  0  0
// a                        1  0  0  0
// c                           1  0  0
// a                              1  0
// a                                 1


//    a  a  a  a
// a  1  1  1  1
// a     1  1  1
// a        1  1
// a           1

