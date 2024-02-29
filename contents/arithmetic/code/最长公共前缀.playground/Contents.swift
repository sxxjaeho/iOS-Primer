import UIKit

/*
 题目：编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例：
 输入：strs = ["flower","flow","flight"]
 输出："fl"
 
 时间复杂度：O(mnlogm) 空间复杂度：O(1)
 */

// 二分查找
func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return "";
    }
    var minLength = Int.max
    for string in strs {
        minLength = min(minLength, string.count)
    }
    // minLenght = 4
    var left = 0, right = minLength - 1
    while left <= right {
        let mid = left + (right - left) / 2
        // 1. left = 0, right = 3, mid = 1
        // 2. left = 2, right = 3, mid = 2
        if isCommonPrefix(strs, mid + 1) {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return String(String(strs.first!.prefix(left)))
}

func isCommonPrefix(_ strs: [String], _ mid: Int) -> Bool {
    let prefix = String(strs.first!.prefix(mid))
    // 1. mid:2, prefix = fl
    // 2. mid:3, prefix = flo
    for string in strs {
        if !string.hasPrefix(prefix) {
            return false
        }
    }
    return true
}

print(longestCommonPrefix(["flower","flow","flight"]))
