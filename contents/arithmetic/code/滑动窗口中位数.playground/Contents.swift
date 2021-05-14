import UIKit

/*
 题目：中位数是有序序列最中间的那个数。如果序列的大小是偶数，则没有最中间的数；此时中位数是最中间的两个数的平均数。
 
 例如：
 [2,3,4]，中位数是 3
 [2,3]，中位数是 (2 + 3) / 2 = 2.5
 
 给出一个数组 nums，有一个大小为 k 的窗口从最左端滑动到最右端。窗口中有 k 个数，每次窗口移动 1 位。你的任务是找出每次窗口移动后得到的新窗口中元素的中位数，并输出由它们组成的数组。
 
 例如：
 给出 nums = [1,3,-1,-3,5,3,6,7]，以及 k = 3。
 
 窗口位置                       中位数
 ---------------------------   -----
 [1  3  -1] -3  5  3  6  7       1
 1 [3  -1  -3] 5  3  6  7      -1
 1  3 [-1  -3  5] 3  6  7      -1
 1  3  -1 [-3  5  3] 6  7       3
 1  3  -1  -3 [5  3  6] 7       5
 1  3  -1  -3  5 [3  6  7]      6
 
 因此，返回该滑动窗口的中位数数组 [1,-1,-1,3,5,6]。
 
 时间复杂度：O(Nlogk)，其中 N 是数组的长度 空间复杂度：O(N)
 */

var max = Heap<Int>(sort: >)
var min = Heap<Int>(sort: <)

func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double]? {
    if nums.count == 0 { return nil }
    
    var res = [Double]()
    
    for (index, value) in nums.enumerated() {
        if max.isEmpty || value <= max.peek()! {
            // 1.     max = [1], min = []
            // 3.     max = [1, -1], min = [3]
            // 4.     max = [1, -1, -3], min = [3]
            max.insert(value)
        } else {
            // 2.     max = [1], min = [3]
            // 5.     max = [-1, -3], min = [3, 5]
            // 6.     max = [-1, -3], min = [3, 5]
            // 7.     max = [3, -3], min = [5, 6]
            // 8.     max = [5, 3], min = [6, 7]
            min.insert(value)
        }
        
        balance()
        
        let removeIndex = index - k
        if removeIndex >= 0 {
            if nums[removeIndex] > max.peek()! {
                // 4.     max = [-1, -3], min = [3]
                // 6.     max = [-3], min = [5, 3]
                // 7.     max = [3], min = [5, 6]
                // 8.     max = [3], min = [6, 7]
                min.remove(node: nums[removeIndex])
            } else {
                // 5.     max = [-1, -3], min = [5]
                max.remove(node: nums[removeIndex])
            }
            balance()
        }
        
        
        if index >= k - 1 {
            if k % 2 == 0 {
                res.append(Double((min.peek()! + max.peek()!)) / 2)
            } else {
                // 3.    res = [1]
                // 4.    res = [1, -1]
                // 5.    res = [1, -1, -1]
                // 6.    res = [1, -1, -1, 3]
                // 7.    res = [1, -1, -1, 3, 5]
                // 8.    res = [1, -1, -1, 3, 5, 6]
                res.append(Double(max.peek()!))
            }
        }
    }
    
    return res
}

func balance() {
    // 最大堆数多于最小堆数2个
    if min.count < max.count - 1 {
        // 4.     max = [-1, -3], min = [1, 3]
        min.insert(max.remove()!)
    }
    // 最小堆数多于最大堆数
    if max.count < min.count {
        // 6.     max = [3, -3], min = [5]
        // 7.     max = [5, 3], min = [6]
        // 8.     max = [6, 3], min = [7]
        max.insert(min.remove()!)
    }
}

let array = [1, 3, -1, -3, 5, 3, 6, 7]
print(medianSlidingWindow(array, 3) ?? [])
