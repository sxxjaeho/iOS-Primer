import UIKit

// 题目：给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那两个整数，并返回他们的数组下标。

func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    // key:数 value:下标
    var dictionary = [Int: Int]()
    var result = [[Int]]()
    for (index, value) in nums.enumerated() {
        // 与当前遍历的数作和等于目标值的数的下标(之前遍历过的一个数)
        if let differenceIndex = dictionary[target - value] {
            result.append([differenceIndex, index])
        }
        dictionary[value] = index
    }
    return result
}

print(twoSum([2, 7, 5, 1, 2, 4], 9))
