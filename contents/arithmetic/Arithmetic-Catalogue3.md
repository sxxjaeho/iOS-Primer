
   * [探索字节跳动-部分算法题解](#探索字节跳动-部分算法题解)
      * [挑战字符串](#挑战字符串)
        * [1.无重复字符的最长子串](#1无重复字符的最长子串)
        * [2.最长公共前缀](#2最长公共前缀)
        * [3.字符串的排列](#3字符串的排列)
        * [5.翻转字符串里的单词](#5翻转字符串里的单词)
        * [6.简化路径](#6简化路径)
      * [数组与排序](#数组与排序)
        * [1.三数之和](#1三数之和)
        * [4.最长连续递增序列](#4最长连续递增序列)
        * [5.数组中的第K个最大元素](#5数组中的第K个最大元素)
        * [6.最长连续序列](#6最长连续序列)
      * [链表与树](#链表与树)
        * [1.合并两个有序链表](#1合并两个有序链表) 
        * [2.反转链表](#2反转链表)
        * [8.二叉树的最近公共祖先](#8二叉树的最近公共祖先)
      * [动态或贪心](#动态或贪心)
        * [1.买卖股票的最佳时机](#1买卖股票的最佳时机)
        * [2.买卖股票的最佳时机II](#2买卖股票的最佳时机II)
        * [4.最大子序和](#4最大子序和)
        * [5.三角形最小路径和](#5三角形最小路径和)


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
```

**时间复杂度：O(n) 
空间复杂度：O(∣Σ∣)，其中 Σ 表示字符集（即字符串中可以出现的字符），∣Σ∣ 表示字符集的大小**

***

### 2.最长公共前缀

[最长公共前缀.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/最长公共前缀.playground)

[题目](https://leetcode-cn.com/problems/longest-common-prefix/)：编写一个函数来查找字符串数组中的最长公共前缀。

如果不存在公共前缀，返回空字符串 ""。

示例 1：

```
输入：strs = ["flower","flow","flight"]
输出："fl"
```

示例 2：

```
输入：strs = ["dog","racecar","car"]
输出：""
解释：输入不存在公共前缀。
```

```
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return "";
    }
    var minLength = Int.max
    for string in strs {
        minLength = min(minLength, string.count)
    }
    var left = 0, right = minLength - 1
    while left <= right {
        let mid = left + (right - left) / 2
        if isCommonPrefix(strs, mid + 1) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return String(String(strs.first!.prefix(left)))
}

func isCommonPrefix(_ strs: [String], _ mid: Int) -> Bool {
    let prefix = String(strs.first!.prefix(mid))
    for string in strs {
        if !string.hasPrefix(prefix) {
            return false
        }
    }
    return true
}

print(longestCommonPrefix(["flower","flow","flight"]))
```

**时间复杂度：O(mnlogm) 空间复杂度：O(1)**

***

### 3.字符串的排列

[字符串的排列.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/字符串的排列.playground)

[题目](https://leetcode-cn.com/problems/permutation-in-string/)：给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。

换句话说，第一个字符串的排列之一是第二个字符串的 子串 。

示例 1：

```
输入: s1 = "ab" s2 = "eidbaooo"
输出: True
解释: s2 包含 s1 的排列之一 ("ba").
```

示例 2：

```
输入: s1= "ab" s2 = "eidboaoo"
输出: False
```

```
func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    let s2Array = Array(s2)
    
    var window =  Dictionary<Character, Int>()
    var target = Dictionary<Character, Int>()
    
    for character in s1 {
        target[character, default: 0] += 1
    }
    
    var left = 0, right = 0
    var counter = 0
    
    while right < s2Array.count {
        let rightItem = s2Array[right]
        right += 1
        
        if target[rightItem] != nil {
            window[rightItem, default: 0] += 1
            if window[rightItem] == target[rightItem] {
                counter += 1
            }
        } else {
            continue
        }
        
        while counter == target.count {
            if right - left == s1.count {
                return true
            }
            
            let leftItem = s2Array[left]
            left += 1
            if target[leftItem] != nil {
                if window[leftItem] == target[leftItem] {
                    counter -= 1
                }
                window[leftItem]! -= 1
            }
        }
    }
    return false
}

print(checkInclusion("ab", "eiadboaooo"))
```

**时间复杂度：O(n+m+∣Σ∣)
空间复杂度：O(∣Σ∣)**

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

func reverseWords1(_ sentence: String) -> String {
    return sentence.split { $0.isWhitespace }.reversed().joined(separator: " ")
}
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
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***

## 数组与排序

### 1.三数之和

[三数之和.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/三数之和.playground)

[题目](https://leetcode-cn.com/problems/3sum/)：给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

注意：答案中不可以包含重复的三元组。

示例：

```
给定数组 nums = [-1, 0, 1, 2, -1, -4]，

满足要求的三元组集合为：
[
  [-1, 0, 1],
  [-1, -1, 2]
]
```

```
func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else {
        return []
    }

    let sortedNums = nums.sorted()

    var resultArray = [[Int]]()

    var resultSet: Set<Set<Int>> = []

    for (index, value) in sortedNums.enumerated() {
        guard index < sortedNums.count - 2 else {
            break
        }

        var ahead = sortedNums.count - 1
        var behind = index + 1
        while ahead > behind {
            let curSum = sortedNums[ahead] + sortedNums[behind]
            if curSum == 0 - value {
                if !resultSet.contains([value, sortedNums[ahead], sortedNums[behind]]) {
                    resultArray.append([value, sortedNums[ahead], sortedNums[behind]])
                    resultSet.insert([value, sortedNums[ahead], sortedNums[behind]])
                }
                behind += 1
            } else if curSum > 0 - value {
                ahead -= 1
            } else {
                behind += 1
            }
        }
    }
    return resultArray
}
```

**时间复杂度：O(n<sup>2</sup>) 空间复杂度：O(logN)**

***

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
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***

### 5.数组中的第K个最大元素

[数组中的第K个最大元素.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/数组中的第K个最大元素.playground)

[题目](https://leetcode-cn.com/problems/kth-largest-element-in-an-array/)：在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

示例：

```
输入: [3,2,1,5,6,4] 和 k = 2
输出: 5
```

```
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    return nums.sorted { return $0 > $1}[k - 1]
}
```

**时间复杂度：O(nlogn) 空间复杂度：O(logn)**

***

### 6.最长连续序列

[最长连续序列.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/最长连续序列.playground)

[题目](https://leetcode-cn.com/problems/longest-consecutive-sequence/)：给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

进阶：你可以设计并实现时间复杂度为 O(n) 的解决方案吗？

示例：

```
输入：nums = [100,4,200,1,3,2]
输出：4
解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
```

```
func longestConsecutive(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.count
    }
    let numSet = Set(nums)
    var maxLenght = 0
    for num in numSet {
        if !numSet.contains(num - 1) {
            var currentNum = num + 1
            while numSet.contains(currentNum) {
                currentNum += 1
            }
            maxLenght = max(maxLenght, currentNum - num)
        }
    }
    return maxLenght
}
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***

## 链表与树

### 1.合并两个有序链表

[合并两个有序链表.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/合并两个排序的链表.playground)

[题目](https://leetcode-cn.com/problems/merge-two-sorted-lists/)：将两个升序链表合并为一个新的**升序**链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

示例：

```
输入：l1 = [1,2,4], l2 = [1,3,4]
输出：[1,1,2,3,4,4]
```

```
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil {
        return l2
    } else if l2 == nil {
        return l1
    }
    var newHead: ListNode? = nil
    if l1!.val < l2!.val {
        newHead = l1
        newHead?.next = mergeTwoLists(l1?.next, l2)
    } else {
        newHead = l2
        newHead?.next = mergeTwoLists(l1, l2?.next)
    }
    return newHead
}
```

**时间复杂度：O(n+m) 空间复杂度：O(n+m)**

***

### 2.反转链表

[反转链表.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/反转链表.playground)

[题目](https://leetcode-cn.com/problems/reverse-linked-list/)：反转一个单链表。

示例：

```
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
```

```
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
func reverseList(_ head: ListNode?) -> ListNode? {
    var reversedHead: ListNode? = nil
    var node: ListNode? = head
    var prev: ListNode? = nil
    while node != nil {
        let next = node?.next
        if next == nil {
            reversedHead = node
        }
        node?.next = prev
        prev = node
        node = next
    }
    return reversedHead
}
```

**时间复杂度：O(n) 空间复杂度：O(1)**

***

### 8.二叉树的最近公共祖先

[二叉树的最近公共祖先.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/二叉树的最近公共祖先.playground)

[题目](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/)：给定一个二叉树, 找到该树中两个指定节点的最近公共祖先。

最近公共祖先的定义为：“对于有根树 T 的两个节点 p、q，最近公共祖先表示为一个节点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

示例：

```
输入：root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
输出：3
解释：节点 5 和节点 1 的最近公共祖先是节点 3 。
```

```
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    if root == nil || root?.val == p?.val || root?.val == q?.val {
        return root
    }
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    return left == nil ? right : (right == nil ? left : root)
}
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***

## 动态或贪心

### 1.买卖股票的最佳时机

[买卖股票的最佳时机.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/买卖股票的最佳时机.playground)

[题目](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/)：给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。

你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。

示例：

```
输入：[7,1,5,3,6,4]
输出：5
解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
     注意利润不能是 7-1 = 6，因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
```

```
func maxProfit(_ prices: [Int]) -> Int {
    var dp = [Int](repeating: 0, count: prices.count)
    var minPrice = prices[0];
    var maxProfit = 0;
    for i in 1..<prices.count {
        if prices[i] < minPrice {
            minPrice = prices[i]
        } else {
            dp[i] = prices[i] - minPrice
            maxProfit = max(dp[i], maxProfit)
        }
    }
    return maxProfit
}
```

**时间复杂度：O(n) 空间复杂度：O(1)**

***

### 2.买卖股票的最佳时机II

[买卖股票的最佳时机II.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/买卖股票的最佳时机II.playground)

[题目](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/)：给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。

注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

示例：

```
输入: [7,1,5,3,6,4]
输出: 7
解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出，这笔交易所能获得利润 = 5-1 = 4 。
     随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，这笔交易所能获得利润 = 6-3 = 3 。
```

```
func maxProfit(_ prices: [Int]) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
    dp[0][0] = 0
    dp[0][1] = -prices[0]
    for i in 1..<prices.count {
        dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
        dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
    }
    return dp[prices.count - 1][0];
}
```

**时间复杂度：O(n) 空间复杂度：O(n)**

***

### 4.最大子序和

[最大子序和.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/最大子序和.playground)

[题目](https://leetcode-cn.com/problems/maximum-subarray/)：给定一个整数数组 nums，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

示例：

```
输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
输出：6
解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
```

```
func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.first!
    }
    var dp = [Int](repeating: 0, count: nums.count)
    dp[0] = nums[0]
    var sum = dp[0]
    for i in 1..<nums.count {
        dp[i] = max(dp[i-1]+nums[i], nums[i]);
        sum = max(dp[i], sum)
    }
    return sum
}
```

**时间复杂度：O(n) 空间复杂度：O(1)**

***

### 5.三角形最小路径和

[三角形最小路径和.playground](https://github.com/sxxjaeho/iOS-Primer/blob/master/contents/arithmetic/code/三角形最小路径和.playground)

[题目](https://leetcode-cn.com/problems/triangle/)：给定一个三角形 triangle ，找出自顶向下的最小路径和。

每一步只能移动到下一行中相邻的结点上。

相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。

示例：

```
输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
输出：11
解释：自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
```

```
func minimumTotal(_ triangle: [[Int]]) -> Int {
    var mini = triangle[triangle.count-1]
    for i in (0..<triangle.count-1).reversed() {
        for j in (0...triangle[i].count-1) {
            mini[j] = triangle[i][j] + min(mini[j], mini[j+1]);
        }
    }
    return mini[0]
}
```

**时间复杂度：O(n<sup>2</sup>) 空间复杂度：O(n<sup>2</sup>)**

***