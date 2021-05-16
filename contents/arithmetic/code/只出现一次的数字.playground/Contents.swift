import UIKit

/*
 题目：给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 
 说明：
 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例:
 输入: [2,2,1]
 输出: 1
 */

// 时间复杂度：O(n) 空间复杂度：O(∣Σ∣)，其中 Σ 是字符集
func singleNumber(_ nums: [Int]) -> Int? {
    var dictionary = [Int: Int]()
    for num in nums {
        if dictionary[num] == nil {
            dictionary[num] = 1
        } else {
            dictionary[num]! += 1
        }
    }
    for num in nums {
        if dictionary[num]! == 1 {
            return num
        }
    }
    return nil
}

// 不使用额外空间来实现：异或运算
// 任何数和 0 做异或运算，结果仍然是原来的数
// 任何数和其自身做异或运算，结果是 0
// 异或运算满足交换律和结合律
// 时间复杂度：O(n)，其中 n 是数组长度。只需要对数组遍历一次。
// 空间复杂度：O(1)。
//func singleNumber1(_ nums: [Int]) -> Int? {
//    var singleNumber = 0
//    for num in nums {
//        // 4
//        // 5
//        // 7
//        // 6
//        // 4
//        singleNumber = num ^ singleNumber
//    }
//    return singleNumber
//}

let nums = [4, 1, 2, 1, 2]
print(singleNumber(nums) ?? 0)
