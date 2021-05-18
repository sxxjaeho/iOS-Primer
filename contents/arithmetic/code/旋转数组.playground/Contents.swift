import UIKit

/*
 题目：给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 
 进阶：

 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？
  

 示例：

 输入：nums = [1,2,3,4,5,6,7], k = 3
 输出：[5,6,7,1,2,3,4]
 解释：
 向右旋转 1 步：[7,1,2,3,4,5,6]
 向右旋转 2 步：[6,7,1,2,3,4,5]
 向右旋转 3 步：[5,6,7,1,2,3,4]
 */

// 时间复杂度：O(n) 空间复杂度：O(n)
func rotate(_ nums: inout [Int], _ k: Int) {
    var res = Array(repeating: 0, count: nums.count)
    for i in 0..<nums.count {
        res[(i+k)%nums.count] = nums[i]
    }
    nums = res
}

// 时间复杂度：O(n) 空间复杂度：O(1)
func rotate1(_ nums: inout [Int], _ k: Int) {
    // 整体旋转
    reverse(&nums, 0, nums.count - 1)
    
    let k = k % nums.count
    // 局部旋转
    reverse(&nums, 0, k - 1);
    reverse(&nums, k, nums.count - 1);
}
func reverse(_ nums: inout [Int], _ start: Int, _ end: Int) {
    var start = start
    var end = end
    
    while start < end {
        nums.swapAt(start, end)
        start = start + 1
        end = end - 1
    }
}


var nums = [1,2,3,4,5,6,7]
rotate1(&nums, 3)
print(nums)
