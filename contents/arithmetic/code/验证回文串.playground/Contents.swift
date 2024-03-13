import UIKit

/*
 如果在将所有大写字符转换为小写字符、并移除所有非字母数字字符之后，短语正着读和反着读都一样。则可以认为该短语是一个回文串 。

 字母和数字都属于字母数字字符。

 给你一个字符串 s，如果它是 回文串 ，返回 true ；否则，返回 false 。

  

 示例 1：
 输入: s = "A man, a plan, a canal: Panama"
 输出：true
 解释："amanaplanacanalpanama" 是回文串。
 
 示例 2：
 输入：s = "race a car"
 输出：false
 解释："raceacar" 不是回文串。
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

// 双指针解法
func isPalindrome(_ s: String) -> Bool {
    let array = [Character](s)
    var left = 0, right = array.count - 1
    var res = true
    while left < right {
        if !array[left].isLetter && !array[left].isNumber {
            left += 1
            continue
        }
        if !array[right].isLetter && !array[right].isNumber {
            right -= 1
            continue
        }
        if array[left].lowercased() != array[right].lowercased() {
            res = false
            break
        }
        left += 1
        right -= 1
    }
    return res
}

// API
func isPalindrome1(_ s: String) -> Bool {
    let tmpStr = s.filter { $0.isNumber || $0.isLetter }.lowercased()
    return tmpStr == String(tmpStr.reversed())
}

print(isPalindrome("A man, a plan, a canal: Panama"))
