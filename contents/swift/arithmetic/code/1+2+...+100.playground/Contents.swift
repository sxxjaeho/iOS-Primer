import UIKit

// 题目：1+2+...+100

// 递归
func sum1(_ num: Int) -> Int {
    if num == 1 {
        return 1
    }
    return num + sum1(num - 1)
}

// 循环
func sum2(_ num: Int) -> Int {
    var sum = 0
    for i in 1...num {
        sum += i
    }
    return sum
}

// 等差数列
// 求和公式
// (首项 + 末项) × 项数 ÷ 2
func sum3(_ num: Int) -> Int {
    return (1 + num) * num / 2
}

print(sum3(100))


// 题目：计算 n 加到 m 的值
func sum4(_ n: Int, _ m: Int) -> Int {
    if n == m {
        return n
    }
    return sum4(n, m - 1) +  m
}

print(sum4(99, 100))
