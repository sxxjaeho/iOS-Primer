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
// 时间复杂度：O(n²) 空间复杂度：O(1)
//func sortArray(_ nums: inout [Int]) {
//    guard nums.count > 1 else {
//        return
//    }
//    for i in 0..<nums.count - 1 {
//        for j in i+1..<nums.count {
//            if nums[i] > nums[j] {
//                nums.swapAt(i, j)
//            }
//        }
//    }
//}

// 快速排序
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

func sortArray(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else {
        return nums
    }
    var nums = nums
    quickSort(&nums, left: 0, right: nums.count - 1)
    return nums
}

// 时间复杂度：O(nlogn) 空间复杂度：O(logn)
func quickSort(_ arr: inout [Int], left: Int, right: Int) {
    if left < right {
        let pivot = partition(&arr, left: left, right: right)
        quickSort(&arr, left: left, right: pivot - 1)
        quickSort(&arr, left: pivot + 1, right: right)
    }
}

func partition(_ arr: inout [Int], left: Int, right: Int) -> Int {
    let pivotIndex = Int.random(in: left...right)
    let pivotValue = arr[pivotIndex]
    // index=2, value=3, right=3
    
    // index=0, value=2, right=1
    arr.swapAt(pivotIndex, right)
    // arr=[5, 2, 1, 3]
    
    // arr=[1, 2, 3, 5]
    var i = left
    // i=0
    
    // i=0
    for j in left..<right {
        if arr[j] <= pivotValue {
            arr.swapAt(i, j)
            i += 1
            //j=1 arr=[2, 5, 1, 3], i=1
            //j=2 arr=[2, 1, 5, 3], i=2
            
            //j=0 arr=[1, 2, 3, 5], i=1
        }
    }
    arr.swapAt(right, i)
    // arr=[2, 1, 3, 5]
    
    // arr=[1, 2, 3, 5]
    return i
}

var nums = [5, 2, 3, 1]
//sortArray(&nums)
//print(nums)
print(sortArray(nums))
