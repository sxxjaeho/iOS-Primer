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
        // 判断当前字符是目标字符串里的字符,是则扩窗口,并把计数器+1,否则跳过
        if target[rightItem] != nil {
            window[rightItem, default: 0] += 1             //    [ ]
            if window[rightItem] == target[rightItem] {    // eidbaooo
                counter += 1                               // window: {"b":1}, right:3, counter:1
            }                                              // window: {"a":1, "b":1}, right:5, counter:2
            
        } else {                                           // leftItem:e left:0->1 right:5
            continue                                       // leftItem:i left:1->2 right:5
        }                                                  // leftItem:d left:2->3 right:5
                                                           // 5-3 = 2 true
        // 判断计数器是否等于目标字符
        while counter == target.count {
            // 长字符串缩紧到窗口大小
            if right - left == s1.count {
                return true
            }
            
            let leftItem = s2Array[left]
            left += 1
            
            // 长字符串缩紧到窗口大小之前发现当前遍历的长字符串的字符为目标字符串里的字符,则缩窗口,并把计数器-1
            if target[leftItem] != nil {
                if window[leftItem] == target[leftItem] { // window里可能有多个重复的字符,所以要跟target里的数量作对比
                    counter -= 1                          // 例如:adc,dcda
                }                                         // wid["d": 2, "c": 1, "a": 1],
                window[leftItem]! -= 1                    // 这时候计数器不应该-1,只需要移动左指针
            }
        }
    }
    return false
}

//print(checkInclusion("ab", "eidbaooo"))
//print(checkInclusion("ab", "eidboaooo"))
print(checkInclusion("adc", "dcda"))

// ["d": 2, "c": 1, "a": 1] 3 4

// eiadboaooo
// window: {"a":1}, right:3, counter:1
// window: {"a":1, "b":1}, right:5, counter:2
//
// leftItem:e left:0->1 right:5
// leftItem:i left:1->2 right:5                         [  ]
// leftItem:a left:2->3 right:5 {"a": 0, "b": 1}      eiadboaooo
//
// window: {"a":1, "b":1}, right:7, counter:2
// leftItem:d left:3->4 right:7
// leftItem:b left:4->5 right:7 {"a": 1, "b": 0}
