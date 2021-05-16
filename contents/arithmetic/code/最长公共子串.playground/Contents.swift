import UIKit

/*
 题目：给定两个字符串str1和str2,输出两个字符串的最长公共子串
 题目保证str1和str2的最长公共子串存在且唯一。
 
 示例：
 输入："1AB2345CD","12345EF"
 输出："2345"
 
 时间复杂度：O(N x M) 空间复杂度：O(N x M)
 */

// dp[j] = 最长公共子串的长度
// dp[j] = i  = j, 上一个最长长度 + 1
//         i != j, 0

//func LCS ( _ str1: String,  _ str2: String) -> String {
//    let char1 = Array(str1)
//    let char2 = Array(str2)
//    var dp = Array(repeating: 0, count: str2.count + 1)
//
//    var preLen = 0
//    var resLen = 0
//    var endIndex = 0
//    for i in 1...str1.count {
//        for j in 1...str2.count {
//            let len = dp[j]
//            if char1[i-1] == char2[j-1] {
//                dp[j] = preLen + 1
//                if dp[j] > resLen {
//                    resLen = dp[j]
//                    endIndex = j - 1
//                }
//            } else {
//                dp[j] = 0
//            }
//            preLen = len
//        }
//    }
//    return String(char2[endIndex-resLen+1...endIndex])
//}

func LCS ( _ str1: String,  _ str2: String) -> String {
    let char1 = Array(str1)
    let char2 = Array(str2)
    
    var dp = Array(repeating: Array(repeating: 0, count: char2.count+1), count: char1.count+1)
    
    var resLen = 0
    var endIndex = 0
    for i in 1...str1.count {
        for j in 1...str2.count {
            if char1[i-1] == char2[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
                if dp[i][j] > resLen {
                    resLen = dp[i][j]
                    endIndex = j - 1
                }
            } else {
                dp[i][j] = 0
            }
        }
    }
    return String(char2[endIndex-resLen+1...endIndex])
}

print(LCS("1AB2345CD", "12345EF"))


//    0  1  2  3  4  5  E  F
// 0  0  0  0  0  0  0  0  0
// 1  0  1  0  0  0  0  0  0
// A  0  0  0  0  0  0  0  0
// B  0  0  0  0  0  0  0  0
// 2  0  0  1  0  0  0  0  0
// 3  0  0  0  2  0  0  0  0
// 4  0  0  0  0  3  0  0  0
// 5  0  0  0  0  0  4  0  0
// C  0  0  0  0  0  0  0  0
// D  0  0  0  0  0  0  0  0
