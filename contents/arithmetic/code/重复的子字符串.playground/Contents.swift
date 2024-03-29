import UIKit

/*
 题目：给定一个非空的字符串，判断它是否可以由它的一个子串重复多次构成。给定的字符串只含有小写英文字母，并且长度不超过10000。
 
 示例：
 输入："abab"
 输出：True
 
 解释：可由子字符串 "ab" 重复两次构成。
 */

// 双倍字符串,去掉首位,截取后的字符串是否包含s
func repeatedSubstringPattern(_ s: String) -> Bool {
    (s + s).dropFirst().dropLast().contains(s)
}
