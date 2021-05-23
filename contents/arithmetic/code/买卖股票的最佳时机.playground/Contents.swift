import UIKit

/*
 题目：给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
 
 你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。

 返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
 
 示例：
 输入：[7,1,5,3,6,4]
 输出：5
 解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
      注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
 */

// DP状态定义:
// DP(i):到i天获取的最大利润

// DP方程:
// DP(i) = prices[i] - minPrice

func maxProfit(_ prices: [Int]) -> Int {
//    // 时间复杂度O(n^2)
//    var maxProfit = 0;
//    for i in 0..<prices.count {
//        for j in i+1..<prices.count {
//            let profit = prices[j] - prices[i]
//            if profit > maxProfit {
//                maxProfit = profit
//            }
//        }
//    }
//    return maxProfit;
    
//    // 时间复杂度O(n)
//    var maxProfit = 0;
//    var minPrice = Int.max;
//    for i in 0..<prices.count {
//        if prices[i] < minPrice {
//            minPrice = prices[i]
//        } else if (prices[i] - minPrice > maxProfit) {
//            maxProfit = prices[i] - minPrice
//        }
//    }
//    return maxProfit
    
    // 时间复杂度O(n)
    var dp = [Int](repeating: 0, count: prices.count)
    var minPrice = prices[0];
    var maxProfit = 0;
    for i in 1..<prices.count {
        if prices[i] < minPrice {
            minPrice = prices[i]
        } else {
            dp[i] = prices[i] - minPrice
            maxProfit = max(dp[i], maxProfit)
            // [0, 0, 4, 0, 0, 0] 4
            // [0, 0, 4, 2, 0, 0] 4
            // [0, 0, 4, 2, 5, 0] 5
            // [0, 0, 4, 2, 5, 3] 5
        }
    }
    return maxProfit
}

print(maxProfit([7, 1, 5, 3, 6, 4]))
