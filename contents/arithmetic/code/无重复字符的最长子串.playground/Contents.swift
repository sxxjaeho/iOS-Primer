import UIKit

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 示例 2:
 
 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 */
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
            print(dummy, start)
            // (2, 0)
            // (3, 2)
            // (1, 3)
            start = max(dummy, start)
        }
        length = max(end - start + 1, length)
        
        // {"p":1}
        // {"p":1, "w":"2"}
        // {"p":1, "w":"3"}
        // {"p":1, "w":"3", "k":"4"}
        // {"p":1, "w":"3", "k":"4", "e":"5"}
        // {"p":1, "w":"6", "k":"4", "e":"5"}
        dic[character] = end + 1
    }
    return length
}

print(lengthOfLongestSubstring("pwwkewp"))
