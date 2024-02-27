import UIKit

/*
 题目：给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。
 
 找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 
 返回容器可以储存的最大水量。
 
 说明：你不能倾斜容器。
 
 示例：
 输入：[1,8,6,2,5,4,8,3,7]
 输出：49
 解释：在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 
 */

// 双指针
// 时间复杂度：O(n) 空间复杂度：O(1)
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxAns = 0
    while left < right {
        // 1.ans = 1*8 = 8, max = 8
        // 2.ans = 7*7 = 49, max = 49
        // 3.ans = 3*6 = 18, max = 49
        // 4.ans = 8*5 = 40, max = 49
        // 5.ans = 6*4 = 24, max = 49
        // 6.ans = 2*3 = 6, max = 49
        // 7.ans = 5*2 = 10, max = 49
        // 8.ans = 4*1 = 4, max = 49
        let ans = min(height[left], height[right]) * (right - left)
        maxAns = max(maxAns, ans)
        // 优先剔除矮木板
        if (height[left] <= height[right]) {
            left+=1
        } else {
            right-=1
        }
    }
    return maxAns
}

print(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]))

