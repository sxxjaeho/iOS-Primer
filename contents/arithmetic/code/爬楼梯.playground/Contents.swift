import UIKit

/*
 题目：假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 示例：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

// DP状态的定义:
// DP(n):到第n阶的总走法个数

// DP方程:
// DP(n) = DP(n-1) + DP(n-2)

func climbStairs(_ n: Int) -> Int {
    if n <= 2  {
        return n
    }
    // [0, 0, 0, 0, 0]
    var mem = Array(repeating: 0, count: n)
    mem[0] = 1
    mem[1] = 2
    // [1, 2, 0, 0, 0]
    for i in 2..<n {
        // [1, 2, 3, 0, 0]
        // [1, 2, 3, 5, 0]
        // [1, 2, 3, 5, 8]
        mem[i] = mem[i-1] + mem[i-2]
    }
    return mem[n-1]
}

print(climbStairs(5))

