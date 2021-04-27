
   * [牛客题霸-客户端爱考](#牛客题霸-客户端爱考)
      * [NC127.最长公共子串](#NC127最长公共子串)

# 牛客题霸-客户端爱考
[牛客题霸-客户端爱考](https://www.nowcoder.com/activity/oj)

## NC127.最长公共子串

[最长公共子串.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/最长公共子串.playground)

[题目](https://www.nowcoder.com/practice/f33f5adc55f444baa0e0ca87ad8a6aac)：给定两个字符串str1和str2,输出两个字符串的最长公共子串
题目保证str1和str2的最长公共子串存在且唯一。

示例 1：

```
输入: "1AB2345CD","12345EF"
输出: "2345"
```

```
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
```

**时间复杂度：O(N x M) 
空间复杂度：O(N x M)**

***