import UIKit

/*
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。

 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。

 示例：
 输入: [7,1,5,3,6,4]
 输出: 7
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
      随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

// DP状态定义:
// DP[i][j]:到i天卖出获取的最大利润
//          j表示手上是否持有股票

// DP方程
// DP[i, 0] = DP[i-1, 0]              // 前一天没有股票且不动
//            DP[i-1, 1] + prices[i]  // 前一天有过小且卖出
// DP[i, 1] = DP[i-1, 1]              // 前一天有股票且不动
//            DP[i-1, 0] - prices[i]  // 前一天没有股票且买入

func maxProfit(_ prices: [Int]) -> Int {
    var dp = Array(repeating: Array(repeating: 0, count: 2), count: prices.count)
    dp[0][0] = 0
    dp[0][1] = -prices[0]
    for i in 1..<prices.count {
        dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
        dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
    }
    return dp[prices.count - 1][0];
}

print(maxProfit([7, 1, 5, 3, 6, 4]))
