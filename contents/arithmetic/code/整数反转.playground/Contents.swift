import UIKit

/*
 题目：给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。
 
 示例：
 输入：x = 123
 输出：321
 
 时间复杂度：O(log|x|) 空间复杂度：O(1)
 */

func reverse(_ x: Int) -> Int {
    // x 不停对 10 取模，累加到 res * 10
    var res = 0
    var x = x
    while x != 0 {
        // 0 + 3
        // 30 + 2
        // 320 + 1
        res = res * 10 + x%10
        if res > Int32.max || res < Int32.min {
            return 0
        }
        x = x/10
    }
    return res
}
