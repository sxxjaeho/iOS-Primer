import UIKit

// 题目：写一个函数，输入n，求斐波那契（Fibonacci）数列的第n项。

func fibonacciRecursion(_ num : Int) -> Int {
    if num <= 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    return fibonacciRecursion(num - 1) + fibonacciRecursion(num - 2)
}

func fibonacciLoop(_ num : Int) -> Int {
    if num <= 0 {
        return 0
    }
    var (prev, curr) = (0, 1)
    for _ in 1..<num {
        (curr, prev) = (curr + prev, curr)
    }
    return curr
}

print(fibonacciRecursion(6))
print(fibonacciLoop(6))
