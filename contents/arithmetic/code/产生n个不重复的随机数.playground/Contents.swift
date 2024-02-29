import UIKit

/*
 题目：输入一个n，产生n个不重复的随机数
 
 示例：
 输入：10
 输出：[9, 6, 2, 3, 5, 4, 0, 1, 8, 7]
 
 时间复杂度：O(n) 空间复杂度：O(n)
 */

func getRandom(_ num: Int) -> [Int] {
    var nums: [Int] = []
    for i in 0..<num {
        nums.append(i)
    }
    var res = Array(repeating: 0, count: nums.count)
    for i in 0..<num {
        let index = Int(arc4random_uniform(UInt32(nums.count - i)))
        res[i] = nums[index]
        // 将nums取出给res数置为未取过的数
        nums[index] = nums[nums.count - i - 1]
        print("index = \(index), result:\(res), nums:\(nums)")
    }
    return res
}

print(getRandom(10))
