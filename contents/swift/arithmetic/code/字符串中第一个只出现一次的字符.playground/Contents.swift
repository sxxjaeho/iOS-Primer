import UIKit

// 题目：字符串中第一个只出现一次的字符。
// 在字符串中找出第一个只出现一次的字符。如输入“abaccdeff”，则输出“b”。

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
    print(dictionary)
    for char in chars {
        if dictionary[char]! == 1 {
            return char
        }
    }
    return nil
}

print(firstNotRepeatingChar("abaccdeff") ?? "")
