import UIKit

/*
 题目：给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。

 进阶：你可以设计并实现时间复杂度为 O(n) 的解决方案吗？

 示例 1：
 输入：nums = [100,4,200,1,3,2]
 输出：4
 解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

func longestConsecutive(_ nums: [Int]) -> Int {
    guard nums.count > 1 else {
        return nums.count
    }
    let numSet = Set(nums)
    var maxLenght = 0
    for num in numSet {
        if !numSet.contains(num - 1) {
            // num = 1
            var currentNum = num + 1
            // currentNum = 2
            // currentNum = 3
            // currentNum = 4
            // currentNum = 5
            while numSet.contains(currentNum) {
                currentNum += 1
            }
            maxLenght = max(maxLenght, currentNum - num)
            // maxLenght = 4
        }
    }
    return maxLenght
}

print(longestConsecutive([100,4,200,1,3,2]))
