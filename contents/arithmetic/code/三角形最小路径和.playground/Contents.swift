import UIKit

/*
 题目：给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。

 相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。

 例如，给定三角形：

 [
      [2],   // [11, 12, 10, 3]
     [3,4],  // [9, 10, 10, 3]
    [6,5,7], // [7, 6, 10, 3]
   [4,1,8,3]
 ]
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 时间复杂度：O(n²) 空间复杂度：O(n²)
 */

// DP状态定义:
// DP[i, j],从底到(i, j)路径和的最小值,即最终结果是DP[0, 0]

// DP方程:
// DP[i, j] = min(DP(i+1, j), DP(i+1, j+1)) + triangle[i, j]

func minimumTotal(_ triangle: [[Int]]) -> Int {
    // mini = [4, 1, 8, 3]
    var mini = triangle[triangle.count-1]
    for i in (0..<triangle.count-1).reversed() {
        for j in (0...triangle[i].count-1) {
            mini[j] = triangle[i][j] + min(mini[j], mini[j+1]);
            // 倒数第2行的第1个元素 + 倒数第1行的第1第2个元素的最小值
            // mini [7, 1, 8, 3]
        }
    }
    return mini[0]
}

print(minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
