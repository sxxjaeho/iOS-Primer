import UIKit

/*
 题目：给定一组字符，使用原地算法将其压缩。
 压缩后的长度必须始终小于或等于原数组长度。
 数组的每个元素应该是长度为1 的字符（不是 int 整数类型）。
 在完成原地修改输入数组后，返回数组的新长度。
 
 示例：
 输入：
 ["a","a","b","b","c","c","c"]
 输出：
 返回6，输入数组的前6个字符应该是：["a","2","b","2","c","3"]
 说明：
 "aa"被"a2"替代。"bb"被"b2"替代。"ccc"被"c3"替代。
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

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
