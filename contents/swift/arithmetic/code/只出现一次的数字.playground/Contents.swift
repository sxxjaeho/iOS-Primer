import UIKit

// 题目：给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

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

//// 不使用额外空间来实现
//func singleNumber1(_ nums: [Int]) -> Int? {
//    var singleNumber = 0
//    for num in nums {
//        singleNumber = num ^ singleNumber
//    }
//    return singleNumber
//}

let nums = [4, 1, 2, 1, 2]
print(singleNumber(nums) ?? 0)
