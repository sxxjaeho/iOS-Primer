import UIKit

// 题目：给定一组字符，使用原地算法将其压缩。
// 压缩后的长度必须始终小于或等于原数组长度。
// 数组的每个元素应该是长度为1 的字符（不是 int 整数类型）。
// 在完成原地修改输入数组后，返回数组的新长度。

func compress(_ chars: inout[Character]) {
    if chars.isEmpty { return }
    var length = 0, count = 1
    for i in 0..<chars.count {
        if i == chars.count - 1 || chars[i] != chars[i+1] {
            // 4.     i = 3
            // 5.     [a]
            chars[length] = chars[i]
            length += 1
            if count > 1 {
                for char in String(count) {
                    // 6.     [a3]
                    chars[length] = char
                    length += 1
                }
                // 7.     count = 1
                count = 1
            }
        } else {
            // 1.    i = 0, count = 1
            // 2.    i = 1, count = 2
            // 3.    i = 2, count = 3
            count += 1
        }
    }
    chars = Array(chars.prefix(upTo: length))
}

var chars = Array("aaabbccc")
compress(&chars)
print(String(chars))
