import UIKit

/*
 题目：给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。

 示例：
 输入：[0,1,0,3,12]
 输出：[1,3,12,0,0]
 
 时间复杂度：O(n) 空间复杂度：O(1)
 
 */

// 双指针解法
func moveZeroes(_ nums: inout [Int]) {
    var j = 0
    for i in 0..<nums.count {
        //1.
        //2.[1, 0, 0, 3, 2], j=1
        //3.
        //4.[1, 3, 0, 0, 2], j=2
        //5.[1, 3, 2, 0, 0], j=3
        if nums[i] != 0 {
            nums.swapAt(i, j)
            j += 1
        }
    }
}

var nums = [0, 1, 0, 3, 2]
moveZeroes(&nums)
print(nums)
