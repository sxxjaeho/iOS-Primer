import UIKit

/*
 题目：
 给定一个数组arr，返回arr的最长无重复元素子数组的长度，无重复指的是所有数字都不相同。
 子数组是连续的，比如[1,2,3,4,5]的子数组有[1,2]，[2,3,4]等等，但是[1,3,4]不是子数组
 
 示例：
 输入：[2,3,4,5]
 输出：4
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

func maxLength ( _ arr: [Int]) -> Int {
    guard arr.count > 0 else {
        return 0
    }
    
    var dic = [Int : Int]()
    var start = 0, length = 0;
    
    for end in 0..<arr.count {
        // 1. num = 2
        // 2. num = 2
        // 3. num = 3
        // 4. num = 4
        // 5. num = 3
        let num = arr[end]
        if let dummy = dic[num] {
            // 2. start = max(1, 0)
            // 5. start = max(3, 1)
            start = max(dummy, start)
        }
        // 1. length = max(0 - 0 + 1, 0)
        // 2. length = max(1 - 1 + 1, 1)
        // 3. length = max(2 - 1 + 1, 1)
        // 4. length = max(3 - 1 + 1, 2)
        // 5. length = max(4 - 3 + 1, 3)
        length = max(end - start + 1, length)
        
        dic[num] = end + 1
        // 1. dic = [2: 1]
        // 2. dic = [2: 2]
        // 3. dic = [3: 3]
        // 4. dic = [2: 2, 3: 3, 4: 4]
        // 4. dic = [2: 2, 3: 5, 4: 4]
    }
    return length
}

print(maxLength([2,2,3,4,3]))
