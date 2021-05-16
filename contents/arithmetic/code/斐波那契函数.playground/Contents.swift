import UIKit

/*
 题目：写一个函数，输入n，求斐波那契（Fibonacci）数列的第n项。
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

// 递归，效率低
//func fibonacciRecursion(_ num : Int) -> Int {
//    if num <= 0 {
//        return 0
//    }
//    if num == 1 {
//        return 1
//    }
//    return fibonacciRecursion(num - 1) + fibonacciRecursion(num - 2)
//}

// 循环，更实用
func fibonacciLoop(_ num : Int) -> Int {
    if num <= 0 {
        return 0
    }
    var (prev, curr) = (0, 1)
    for _ in 1..<num {
        // 1.     num = 2 (1, 1)
        // 2.           3 (1, 2)
        // 3.           4 (2, 3)
        // 4.           5 (3, 5)
        // 5.           6 (5, 8)
        (prev, curr) = (curr, curr + prev)
    }
    return curr
}

//print(fibonacciRecursion(6))
print(fibonacciLoop(6))
