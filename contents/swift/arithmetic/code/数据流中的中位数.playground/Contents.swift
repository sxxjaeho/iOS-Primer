import UIKit

// 题目：如何得到一个数据流中的中位数？如果从数据流中读出奇数个数值，那么中位数就是所有数值排序之后位于中间的数值。如果从数据流中读出偶数个数值，那么中位数就是所有数值排序之后中间两个数的平均值。

var max = Heap<Int>(sort: >) // 存放数组左边数据
var min = Heap<Int>(sort: <) // 存放数组右边数据

func getMedian(_ nums: [Int]) -> Double? {
    if nums.count == 0 { return nil }

    for num in nums {
        if max.isEmpty || num <= max.peek()! {
           max.insert(num)
        } else {
           min.insert(num)
        }
        balance()
    }
    let size = min.count + max.count
    if size % 2 == 0 {
        return Double((min.peek()! + max.peek()!)) / 2
    } else {
        return Double(min.peek()!)
    }
}

func balance() {
    if max.count < min.count - 1 {
        max.insert(min.remove()!)
    }
    if min.count < max.count {
        min.insert(max.remove()!)
    }
}

let array = [5, 8, 1, 3, 6, 2, 9];
print(getMedian(array) ?? 0)
