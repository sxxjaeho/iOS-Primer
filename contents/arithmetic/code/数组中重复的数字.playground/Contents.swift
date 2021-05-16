import UIKit


/*
 题目：在一个长度为n的数组里的所有数字都在0到n-1的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。例如，如果输入长度为7的数组{2, 3, 1, 0, 2, 5, 3}，那么对应的输出是重复的数字2或者3。
 
 示例：
 输入：
 [2, 3, 1, 0, 2, 5, 3]
 输出：2 或 3
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

func duplicate(_ nums: [Int]) -> Int? {
    var nums = nums
    for index in 0..<nums.count {
        while nums[index] != index {
            print(index)
            // 第0位不是0
            // 第0位的值和第0位应该在的位置的值不相等
            // 交换第0位和第0位应该在的位置的值
            
            // 第4位不是4
            // 第4位的值和第4位应该在的位置的值(第2位的值)相等
            if nums[index] == nums[nums[index]] {
                return nums[index]
            }
            (nums[index], nums[nums[index]]) = (nums[nums[index]], nums[index])
            /*
             [1, 3, 2, 0, 2, 5, 3]
             [3, 1, 2, 0, 2, 5, 3]
             [0, 1, 2, 3, 2, 5, 3]
             */
        }
    }
    return nil
}

func duplicate1(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for num in nums {
        if !set.insert(num).inserted {
            return num
        }
    }
    return -1
}

let nums =  [2, 3, 1, 0, 2, 5, 3]
if let result = duplicate(nums) {
    print(result)
} else {
    print("Not found")
}

