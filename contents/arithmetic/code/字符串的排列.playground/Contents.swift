import UIKit

/*
 题目：给定两个字符串 s1 和 s2，写一个函数来判断 s2 是否包含 s1 的排列。

 换句话说，第一个字符串的排列之一是第二个字符串的子串。
 
 示例
 输入：s1 = "ab" s2 = "eidbaooo"
 输出：True
 解释：s2 包含 s1 的排列之一 ("ba").
 
 时间复杂度：O(n+m+∣Σ∣)，其中 n 是字符串 s1 的长度，m 是字符串 s2 的长度，Σ 是字符集，这道题中的字符集是小写字母，∣Σ∣=26。
 空间复杂度：O(∣Σ∣)。
 */

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let s2Array = Array(s2)
        
        var window =  Dictionary<Character, Int>()
        var target = Dictionary<Character, Int>()
        
        for character in s1 {                                         // target: @{"a":1, "b":1}
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
                    counter += 1                                      // window: @{"a":1}, counter:1
                }                                                     // window: @{"a":1, "b":1}, counter:2
            } else {                                                  // right:5 left:1 leftItem:e
                continue                                              // right:5 left:2 leftItem:i
            }                                                         // right:5 left:3 leftItem:a
            
            while counter == target.count {
                if right - left == s1.count {                         // window: @{"a":1, "b":1}, counter:2
                    return true                                       // right:7 left:4 leftItem:d
                }                                                     // right:7 left:5 leftItem:b
                                                                      
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

//print(checkInclusion("ab", "eidbaooo"))
//print(checkInclusion("ab", "eidboaooo"))
print(checkInclusion("ab", "eiadboaooo"))
