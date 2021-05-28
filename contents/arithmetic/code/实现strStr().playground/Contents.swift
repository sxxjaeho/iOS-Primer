import UIKit

/*
 实现 strStr() 函数。
 
 给你两个字符串 haystack 和 needle ，请你在 haystack 字符串中找出 needle 字符串出现的第一个位置（下标从 0 开始）。如果不存在，则返回  -1 。
 
 说明：
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与 C 语言的 strstr() 以及 Java 的 indexOf() 定义相符。
 
 示例：
 输入：haystack = "hello", needle = "ll"
 输出：2
 */

// 暴力求解 时间复杂度：O(n*m) 空间复杂度：O(1)
func strStr(_ haystack: String, _ needle: String) -> Int {
    let n = haystack.count, m = needle.count
    let haystack = Array(haystack), needle = Array(needle)
    var i = 0
    while i+m <= n {
        var flag = true
        var j = 0
        while j < m {
            if haystack[i + j] != needle[j] {
                flag = false
                break
            }
            j = j + 1
        }
        if flag {
            return i
        }
        i = i + 1
    }
    return -1
}

// KMP 时间复杂度：O(n+m) 空间复杂度：O(m)
// pi 数组存的咱们最长公共前后缀中，前缀的结尾字符下标
// 例如:bcbcbea
// b -1
// bc -1
// bcb 0
// bcbc 1
// bcbcb 2
// bcbcbe -1
// pi[-1, -1, 0, 1, 2, -1]

// 过程
// ↓   ...   ↓
// b c b c b c b c b e a
// ↓   ...   ↓
// b c b c b e a
//         ↑
//  在pi找到b的下标4的元素2

//     ↓  ...    ↓
// b c b c b c b c b e a
// ↓  ...    ↓
// b c b c b e a
//         ↑
//  在pi找到b的下标4的元素2

//         ↓    ...    ↓
// b c b c b c b c b e a
// ↓    ...    ↓
// b c b c b e a

func strStr1(_ haystack: String, _ needle: String) -> Int {
    let n = haystack.count, m = needle.count
    if (m == 0) {
        return 0;
    }
    
    let haystack = Array(haystack), needle = Array(needle)
    var pi = Array(repeating: 0, count: m)
    
    var j = 0
    for i in 1..<m {
        while j > 0 && needle[i] != needle[j] {
            j = pi[j - 1]
        }
        if needle[i] == needle[j] {
            j = j + 1
        }
        pi[i] = j
    }
    
    j = 0
    for i in 0..<n {
        while j > 0 && haystack[i] != needle[j] {
            j = pi[j - 1]
        }
        if haystack[i] == needle[j] {
            print(haystack[i], needle[j])
            j = j + 1
        }
        if j == m {
            return i - m + 1
        }
    }
    return -1
}

print(strStr1("bcbcbdbcbe", "bcbcbea"))
