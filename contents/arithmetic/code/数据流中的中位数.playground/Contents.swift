import UIKit

/*
 题目：如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么中位数就是所有数值排序之后位于中间的数值。如果从数据流中读出偶数个数值，那么中位数就是所有数值排序之后中间两个数的平均值。
 
 示例：
 输入：[5, 8, 1, 3, 6, 2, 9]
 输出：5
 
 时间复杂度：O(logn) 空间复杂度：O(n)
 */

var max = Heap<Int>(sort: >) // 存放数组左边数据
var min = Heap<Int>(sort: <) // 存放数组右边数据

func getMedian(_ nums: [Int]) -> Double? {
    if nums.count == 0 { return nil }

    for num in nums {
        if max.isEmpty || num <= max.peek()! {
            // 1.     max = [5], min = []
            // 2.     max = [5], min = [8]
            // 3.     max = [5, 1], min = [8]
            // 4.     max = [5, 3, 1], min = [8]
            // 6.     max = [5, 3, 2, 1], min = [6, 8]
            max.insert(num)
            print(max, min)
        } else {
            // 5.     max = [3, 1], min = [5, 6, 8]
            // 7.     max = [3, 2, 1], min = [5, 6, 8, 9]
            min.insert(num)
        }
        balance()
    }
    if nums.count % 2 == 0 {
        return Double((min.peek()! + max.peek()!)) / 2
    } else {
        return Double(max.peek()!)
    }
}

func balance() {
    if min.count < max.count - 1 {
        // 4.     max = [3, 1], min = [5, 8]
        // 6.     max = [3, 2, 1], max = [5, 6, 8]
        min.insert(max.remove()!)
    }
    if max.count < min.count {
        // 5.     max = [5, 3, 1], min = [6, 8]
        // 7.     max = [5, 3, 2, 1], min = [6, 8, 9]
        max.insert(min.remove()!)
    }
}

let array = [5, 8, 1, 3, 6, 2, 9];
print(getMedian(array) ?? 0)
