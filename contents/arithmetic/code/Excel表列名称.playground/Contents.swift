import UIKit

/*
 题目：给定一个正整数，返回它在 Excel 表中相对应的列名称。
 
 例如，
 
 1 -> A
 2 -> B
 3 -> C
 ...
 26 -> Z
 27 -> AA
 28 -> AB
 ...

 示例：
 输入：28
 输出："AB"
 
 时间复杂度：0(n) 空间复杂度：O(1)
 */

func convertToTitle(_ n: Int) -> String {
    var str = ""
    var n = n
    
    // n = 28
    while n != 0 {
        let k = (n-1)%26
        // k = 1
        // k = 0
        str.append(Character(UnicodeScalar(65+k)!))
        // str = B
        // str = AB
        n = (n-k)/26
        // n = 1
        // n = 0
    }
    return String(str.reversed())
}
