import UIKit

/*
 题目：写一个函数，求两个整数之和，要求在函数体内不得使用 “+”、“-”、“*”、“/” 四则运算符号。
 
 时间复杂度：O(1) 空间复杂度：O(1)
 */

func add(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b

    // 无进位和 与 异或运算  规律相同
    // 进位    和 与运算    规律相同（并需左移一位）
    while b != 0 {
        let c = (a & b) << 1
        a = a ^ b
        b = c
    }
    return a
}
