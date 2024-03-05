import UIKit

/*
 给定一个字符串，请你找出其中不含有重复字符的最长子串的长度。

 示例:
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是子串的长度，"pwke" 是一个子序列，不是子串。
 
 时间复杂度：O(n) 空间复杂度：O(∣Σ∣)，其中 Σ 表示字符集（即字符串中可以出现的字符），∣Σ∣ 表示字符集的大小
 */
func lengthOfLongestSubstring(_ s: String) -> Int {
    guard s.count > 0 else {
        return 0
    }
    
    var dic = [Character: Int]()
    var start = 0, length = 0;
    
    for end in 0..<s.count {
        let char = Array(s)[end]
        // 1. char: p
        // 2.       w
        // 3.       w
        // 4.       k
        // 5.       e
        // 6.       w
        if let dummy = dic[char] {
            // 3.start: max(2, 0)
            // 6.       max(3, 2)
            // 有重复的就换起点
            start = max(dummy, start)
        }
        // 1.length: max(1, 0)
        // 2.        max(2, 1)
        // 3.        max(1, 2)
        // 4.        max(2, 2)
        // 5.        max(3, 2)
        // 6.        max(3, 3)
        length = max(end - start + 1, length)
        
        // 1.{"p":1}
        // 2.{"p":1, "w":"2"}
        // 3.{"p":1, "w":"3"}
        // 4.{"p":1, "w":"3", "k":"4"}
        // 5.{"p":1, "w":"3", "k":"4", "e":"5"}
        // 6.{"p":1, "w":"6", "k":"4", "e":"5"}
        dic[char] = end + 1
    }
    return length
}

print(lengthOfLongestSubstring("pwwkew"))
