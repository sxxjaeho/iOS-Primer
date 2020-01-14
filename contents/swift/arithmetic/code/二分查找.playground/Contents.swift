import UIKit

// 题目：给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。

func search(_ nums: [Int], _ target: Int) -> Int? {
    guard nums.count != 1 else {
        return 0
    }
    
    var lo = 0, hi = nums.count - 1
    while lo <= hi {
        let mid = lo + (hi - lo) / 2
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            lo = mid + 1
        } else {
            hi = mid - 1
        }
    }
    return nil
}

let nums = [-1, 0, 3, 5, 9, 12]
print(search(nums, 9) as Any)
