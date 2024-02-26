import UIKit

/*
 题目：一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。

 机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。

 问总共有多少条不同的路径？
 
 示例：
 输入：m = 3, n = 3
 输出：6
 
 时间复杂度：O(mn) 空间复杂度：O(mn)

 */

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp = [[Int]](repeating: [Int](repeating: 1, count: n), count: m)
    for i in 1..<m {
        // [[1, 1, 1], [1, 2, 3], [1, 1, 1]]
        // [[1, 1, 1], [1, 2, 3], [1, 3, 6]]
        for j in 1..<n {
            dp[i][j] = dp[i][j - 1] + dp[i - 1][j]
        }
        print(dp)
    }
    //1 1 1    1 1 1
    //1 1 1 => 1 2 3
    //1 1 1    1 3 6
    return dp[m - 1][n - 1]
}

print(uniquePaths(3, 3))
