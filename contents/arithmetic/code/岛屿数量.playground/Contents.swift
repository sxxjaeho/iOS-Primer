import UIKit

/*
 题目：给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。
 
 岛屿总是被水包围，并且每座岛屿只能由水平方向和/或竖直方向上相邻的陆地连接形成。

 此外，你可以假设该网格的四条边均被水包围。

 示例：

 输入：grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 输出：3
 
 时间复杂度：O(mn) 空间复杂度：O(mn)
 */

func numIslands(_ grid: [[Character]]) -> Int {
    guard grid.count > 0 && grid[0].count > 0 else {
        return 0
    }
    var grid = grid
    var res = 0
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            if grid[i][j] == "1" {
                dfs(&grid, i, j)
                res += 1
                print(grid)
            }
        }
    }
    return res
}

func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
    guard grid.count > i && i >= 0 else {
        return
    }
    guard grid[i].count > j && j >= 0 else {
        return
    }
    if grid[i][j] == "0" {
        return
    } else {
        grid[i][j] = "0"
    }
    dfs(&grid, i - 1, j)
    dfs(&grid, i, j - 1)
    dfs(&grid, i + 1, j)
    dfs(&grid, i, j + 1)
}

print(numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]))
