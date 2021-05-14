import UIKit

/*
 题目：给定一个数组，找出其中最小的K个数。例如数组元素是4,5,1,6,2,7,3,8这8个数字，则最小的4个数字是1,2,3,4。如果K>数组的长度，那么返回一个空的数组
 
 示例：
 输入：[4,5,1,6,2,7,3,8],4
 输出：[1,2,3,4]
 
 时间复杂度：O(nlogn)) 空间复杂度：O(logn)
 */

func GetLeastNumbers_Solution ( _ input: [Int],  _ k: Int) -> [Int] {
    if k > input.count {
        return []
    }
    let arry = input.sorted()
    return Array(arry[0..<k])
}

print(GetLeastNumbers_Solution([4,5,1,6,2,7,3,8], 4))
