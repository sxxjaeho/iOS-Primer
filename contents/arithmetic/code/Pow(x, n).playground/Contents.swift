import UIKit

/*
 题目：实现 pow(x, n) ，即计算 x 的 n 次幂函数。
 
 示例 1:
 
 输入: 2.00000, 10
 输出: 1024.00000
 
 时间复杂度：O(logn) 空间复杂度：O(logn)
 */

// 2^5 = 32
func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        // 5.     1
        return 1
    }
    if n < 0 {
        return 1 / myPow(x, -n);
    }
    if n % 2 == 1 {
        // 1.     2 * (2, 4)
        // 4.     16 * (16, 0)
        return x * myPow(x, n - 1);
    }
    // 2.     (4, 2)
    // 3.     (16, 1)
    return myPow(x * x, n / 2)
}

func myPow1(_ x: Double, _ n: Int) -> Double {
    var x = x, n = n
    if n < 0 {
        x = 1 / x
        n = -n
    }
    var pow = 1.0
    while n > 0 {
        if n & 1 == 1 {
            pow *= x
        }
        x *= x
        n = n >> 1
    }
    return pow
}

print(myPow(2, 5))
