import UIKit

// 题目：输入一个递增排序的数组和一个数字 s，在数组中查找两个数，使得它们的和正好是 s。如果有多对数字的和等于 s，输出任意一对即可。

func findNumbersWithSum(_ nums: [Int], _ sum: Int) -> (num1: Int, num2: Int)? {
    if nums.count < 2 {
        return nil
    }
    
    var ahead = nums.count - 1
    var behind = 0
    
    while ahead > behind {
        let curSum = nums[ahead] + nums[behind]
        if curSum == sum {
            return (nums[behind], nums[ahead])
        } else if curSum > sum {
            ahead -= 1
        } else {
            behind += 1
        }
    }
    return nil
}

let result = findNumbersWithSum([1, 2, 4, 7, 11, 15], 10)
if result != nil {
    print(result!)
} else {
    print("未找到符合条件的两个数")
}
