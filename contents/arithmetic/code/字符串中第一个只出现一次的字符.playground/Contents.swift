import UIKit

/*
 题目：字符串中第一个只出现一次的字符。
 在字符串中找出第一个只出现一次的字符。如输入“abaccdeff”，则输出“b”。
 
 示例:
 s = "abaccdeff"
 返回 "b"
 
 时间复杂度：O(n) 空间复杂度：O(∣Σ∣)，其中 Σ 是字符集
 */

func firstNotRepeatingChar(_ string: String) -> Character? {
    let chars = Array(string)
    var dictionary = [Character: Int]()
    for char in chars {
        if dictionary[char] == nil {
            dictionary[char] = 1
        } else {
            dictionary[char]! += 1
        }
    }
    for char in chars {
        if dictionary[char]! == 1 {
            return char
        }
    }
    return nil
}

print(firstNotRepeatingChar("abaccdeff") ?? "")
