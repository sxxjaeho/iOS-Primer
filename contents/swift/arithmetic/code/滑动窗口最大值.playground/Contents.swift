import UIKit

// 题目：给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。

// 返回滑动窗口中的最大值。

/*
示例:

输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
输出: [3,3,5,5,6,7]
解释:

         滑动窗口的位置          最大值
--------------------------    -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
 
 */


var max = Heap<Int>(sort: >)

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int]? {
    if nums.count == 0 { return nil }
    
    var res = [Int]()
    
    for (index, value) in nums.enumerated() {
        max.insert(value)
        
        let removeIndex = index - k
        if removeIndex >= 0 {
            max.remove(node: nums[removeIndex])
        }
        
        if max.count == k {
            res.append(max.peek()!)
        }
    }
    
    return res
}

let array = [1, 3, -1, -3, 5, 3, 6, 7]
if let result = maxSlidingWindow(array, 3) {
    print(result)
}
