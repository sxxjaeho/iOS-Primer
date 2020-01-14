import UIKit

// 题目：给定一个整数数组 nums，将该数组升序排列。

//// 冒泡排序
//func sortArray(_ nums: inout [Int]) {
//    guard nums.count > 1 else {
//        return
//    }
//    for i in 0..<nums.count - 1 {
//        for j in 0..<nums.count - i - 1 {
//            if nums[j] > nums[j+1] {
//                nums.swapAt(j, j+1)
//            }
//        }
//    }
//}

// 选择排序
func sortArray(_ nums: inout [Int]) {
    guard nums.count > 1 else {
        return
    }
    for i in 0..<nums.count - 1 {
        for j in i+1..<nums.count {
            if nums[i] > nums[j] {
                nums.swapAt(i, j)
            }
        }
    }
}

//// 快速排序
//func sortArray(_ nums: [Int]) -> [Int] {
//    guard nums.count > 1 else {
//        return nums
//    }
//    let pivot = nums[nums.count / 2]
//    let left = nums.filter { $0 < pivot}
//    let middle = nums.filter { $0 == pivot}
//    let right = nums.filter { $0 > pivot}
//    return sortArray(left) + middle + sortArray(right)
//}

var nums = [5, 2, 3, 1]
sortArray(&nums)
print(nums)
