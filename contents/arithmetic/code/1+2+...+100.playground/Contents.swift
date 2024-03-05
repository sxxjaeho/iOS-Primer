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
    return m + sum4(n, m - 1)
}

print(sum4(1, 100))

// 题目：计算 n 加 s 到 m 的值
func sum5(_ n: Int, _ m: Int, _ s: Int) -> Int {
    if n > m {
        return 0
    }
    // 1 + sum(3, 10, 2)
    // 1 + 3 + sum(5, 10, 2)
    // 1 + 3 + 5 + sum(7, 10, 2)
    // 1 + 3 + 5 + 7 + sum(9, 10, 2)
    // 1 + 3 + 5 + 7 + 9 + sum(11, 10, 2)
    return n + sum5(n + s, m, s)
}

print(sum5(1, 10, 2))

// swap(a, b)
func swap(_ a: inout Int, _ b: inout Int) {
    (a, b) = (b, a)
}
func swap1(_ a: inout Int, _ b: inout Int) {
    a = a ^ b;
    b = a ^ b;
    a = a ^ b;
}
var a = 1, b = 2
swap1(&a, &b)
print(a, b)
