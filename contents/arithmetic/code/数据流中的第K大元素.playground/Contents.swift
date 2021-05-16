import UIKit


/*
 题目：设计一个找到数据流中第K大元素的类（class）。注意是排序后的第K大元素，不是第K个不同的元素。
 
 你的 KthLargest 类需要一个同时接收整数 k 和整数数组nums 的构造器，它包含数据流中的初始元素。每次调用 KthLargest.add，返回当前数据流中第K大的元素。
 
 示例：
 int k = 3;
 int[] arr = [4,5,8,2];
 KthLargest kthLargest = new KthLargest(3, arr);
 kthLargest.add(3);   // returns 4   // 4 5 8
 kthLargest.add(5);   // returns 5   // 5 5 8
 kthLargest.add(10);  // returns 5   // 10 8 5
 kthLargest.add(9);   // returns 8   // 10 8 9
 kthLargest.add(4);   // returns 8   // 10 8 9
 
 时间复杂度：O(nlogk) 空间复杂度：O(k)
 */

class KthLargest {
    // 最小堆
    var heap = Heap<Int>(sort: <)
    let k : Int
    init(_ k : Int, _ nums : [Int]) {
        self.k = k
        for num in nums {
            self.heap.insert(num)
            if self.heap.count > k {
                // 1.     [8, 5, 4]
                self.heap.remove()
            }
        }
    }
    
    func add(_ num : Int) -> Int {
        if self.heap.count < k {
            self.heap.insert(num)
        }
        if heap.peek()! < num {
            // 3.     [8, 5]
            // 6.     [8, 5]
            // 9.     [10, 8]
            self.heap.remove()
            // 4.     [8, 5, 5]
            // 7.     [10, 8, 5]
            // 10.    [10, 9, 8]
            self.heap.insert(num)
        }
        // 2.     4
        // 5.     5
        // 8.     5
        // 11.     8
        // 12.     8
        return heap.peek()!
    }
}

let kthLargest = KthLargest(3, [4, 5, 8, 2])
let result = kthLargest.add(3)
let result1 = kthLargest.add(5)
let result2 = kthLargest.add(10)
let result3 = kthLargest.add(9)
let result4 = kthLargest.add(4)

print(result)
print(result1)
print(result2)
print(result3)
print(result4)

