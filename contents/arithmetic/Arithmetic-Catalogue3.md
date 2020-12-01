
   * [探索字节跳动-部分算法题解](#探索字节跳动-部分算法题解)
      * [挑战字符串](#挑战字符串)
        * [1.无重复字符的最长子串](#1无重复字符的最长子串)
        * [5.翻转字符串里的单词](#5翻转字符串里的单词)
        * [6.简化路径](#6简化路径)
      * [数组与排序](#数组与排序)
        * [4.最长连续递增序列](#4最长连续递增序列)

# 探索字节跳动-部分算法题解
## 挑战字符串

### 1.无重复字符的最长子串

[无重复字符的最长子串.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/无重复字符的最长子串.playground)

[题目](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/)：给定一个字符串，请你找出其中不含有重复字符的最长子串的长度。

示例 1：

```
输入: "abcabcbb"
输出: 3 
解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
```

示例 2：

```
输入: "bbbbb"
输出: 1
解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
```

示例 3：

```
输入: "pwwkew"
输出: 3
解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
     请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
```

```
func lengthOfLongestSubstring(_ s: String) -> Int {
    let characters = Array(s)
    guard characters.count > 0 else {
        return 0
    }
    
    var dic = [Character : Int]()
    var start = 0, length = 0;
    
    for end in 0..<characters.count {
        let character = characters[end]
        if let dummy = dic[character] {
            start = max(dummy, start)
        }
        length = max(end - start + 1, length)
        dic[character] = end + 1
    }
    return length
}

print(lengthOfLongestSubstring("pwwkew"))
```

**时间复杂度：O(n) 
空间复杂度：O(∣Σ∣)，其中 Σ 表示字符集（即字符串中可以出现的字符），∣Σ∣ 表示字符集的大小**

***

### 5.翻转字符串里的单词

[翻转字符串里的单词.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/翻转字符串.playground)

[题目](https://leetcode-cn.com/problems/reverse-words-in-a-string/solution/fan-zhuan-zi-fu-chuan-li-de-dan-ci-by-leetcode-sol/)：给定一个字符串，逐个翻转字符串中的每个单词。

说明：

无空格字符构成一个 单词 。
输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。

示例 1：

```
输入："the sky is blue"
输出："blue is sky the"
```

示例 2：

```
输入："  hello world!  "
输出："world! hello"
解释：输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
```

示例 3：

```
输入："a good   example"
输出："example good a"
解释：如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
```

```
func reverseWords(_ sentence: String) -> String {
    if sentence.isEmpty {
        return ""
    }
    var chars = Array(trimmingCharacters(sentence))
    var start = 0
    reverse(&chars, 0, chars.count - 1)
    for i in 0...chars.count - 1 {
        if i == chars.count - 1 || chars[i + 1] == " " {
            reverse(&chars, start, i)
            start = i + 2
        }
    }
    return String(chars)
}

func trimmingCharacters(_ s: String) -> String {
    return s.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces).filter { $0 != "" }.joined(separator: " ")
}

func reverse(_ chars: inout Array<Character>, _ begin: Int, _ end: Int) {
    var begin = begin
    var end = end
    
    while begin < end {
        chars.swapAt(begin, end)
        begin += 1
        end -= 1
    }
}

print(reverseWords("  hello  world  "))

func reverseWords1(_ sentence: String) -> String {
    return sentence.split { $0.isWhitespace }.reversed().joined(separator: " ")
}

print(reverseWords1("  hello  world  "))
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***

### 6.简化路径

[简化路径.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/简化路径.playground)

[题目](https://leetcode-cn.com/problems/simplify-path/)：以 Unix 风格给出一个文件的绝对路径，你需要简化它。或者换句话说，将其转换为规范路径。

在 Unix 风格的文件系统中，一个点（.）表示当前目录本身；此外，两个点 （..） 表示将目录切换到上一级（指向父目录）；两者都可以是复杂相对路径的组成部分。更多信息请参阅：Linux / Unix中的绝对路径 vs 相对路径

请注意，返回的规范路径必须始终以斜杠 / 开头，并且两个目录名之间必须只有一个斜杠 /。最后一个目录名（如果存在）不能以 / 结尾。此外，规范路径必须是表示绝对路径的最短字符串。

示例 1：

```
输入："/home/"
输出："/home"
解释：注意，最后一个目录名后面没有斜杠。
```

示例 2：

```
输入："/../"
输出："/"
解释：从根目录向上一级是不可行的，因为根是你可以到达的最高级。
```

示例 3：

```
输入："/home//foo/"
输出："/home/foo"
解释：在规范路径中，多个连续斜杠需要用一个斜杠替换。
```

```
func simplifyPath(_ path: String) -> String {
    let pathArray = path.split(separator: "/")
    var resPathArray = [String]()
    for curPath in pathArray {
        if curPath == "." {
            continue
        } else if curPath == ".." {
            if resPathArray.count > 0 {
                resPathArray.removeLast()
            }
        } else {
            resPathArray.append(String(curPath))
        }
    }
    return "/" + resPathArray.joined(separator: "/")
}

print(simplifyPath("/a//b////c/d//././/.."))
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***


## 数组与排序

### 4.最长连续递增序列

[最长连续递增序列.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/最长连续递增序列.playground)

[题目](https://leetcode-cn.com/problems/longest-continuous-increasing-subsequence/)：给定一个字符串，请你找出其中不含有重复字符的最长子串的长度。

示例 1：

```
 输入：nums = [1,3,5,4,7]
 输出：3
 解释：最长连续递增序列是 [1,3,5], 长度为3。
 尽管 [1,3,5,7] 也是升序的子序列, 但它不是连续的，因为 5 和 7 在原数组里被 4 隔开。
```

示例 2：

```
输入：nums = [2,2,2,2,2]
输出：1
解释：最长连续递增序列是 [2], 长度为1。
```

```
func findLengthOfLCIS(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    var len = 1;
    var dp = Array(repeating: 1, count: nums.count)
    dp[0] = 1
    for i in 1..<nums.count {
        if nums[i-1] < nums[i] {
            dp[i] = dp[i-1] + 1
        }
        len = max(dp[i], len)
    }
    return len
}

print(findLengthOfLCIS([1, 3, 5, 4, 7]))
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***

