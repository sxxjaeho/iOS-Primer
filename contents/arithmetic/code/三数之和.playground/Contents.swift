import UIKit

/*
 题目：给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组
 
 示例：
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]
 
 时间复杂度：O(n2) 空间复杂度：O(logN)
*/

// 快排 + 双指针
func threeSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    guard nums.count >= 3 else {
        return []
    }
    
    // 1.     [-4, -1, -1, 0, 1, 2]
    //    let sortedNums = nums.sorted()
    let sortedNums = sortArray(nums)
    
    var resultArray = [[Int]]()
    
    var resultSet: Set<Set<Int>> = []

    for (index, value) in sortedNums.enumerated() {
        guard index < sortedNums.count - 2 else {
            break
        }
        // 2.      -4 sortedNums[behind] = -1, sortedNums[ahead] = 2
        // 3.                             -1,                      2
        // 4.                              0,                      2
        // 5.                              1,                      2
        // 6.      -1                     -1,                      2  √
        // 7.      -1                      0,                      2
        // 8.                              0,                      1  √
        // 9.       0                      1,                      2
        var ahead = sortedNums.count - 1
        var behind = index + 1
        while ahead > behind {
            let curSum = sortedNums[ahead] + sortedNums[behind]
            if curSum == target - value {
                if !resultSet.contains([value, sortedNums[behind], sortedNums[ahead]]) {
                    resultArray.append([value, sortedNums[behind], sortedNums[ahead]])
                    resultSet.insert([value, sortedNums[ahead], sortedNums[behind]])
                }
                behind += 1
            } else if curSum > target - value {
                ahead -= 1
            } else {
                behind += 1
            }
        }
    }
    return resultArray
}

func sortArray(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else {
        return nums
    }
    let pivot = nums[nums.count / 2]
    let left = nums.filter { $0 < pivot}
    let middle = nums.filter { $0 == pivot}
    let right = nums.filter { $0 > pivot}
    return sortArray(left) + middle + sortArray(right)
}

print(threeSum([-1, 0, 1, 2, -1, -4], 0))
