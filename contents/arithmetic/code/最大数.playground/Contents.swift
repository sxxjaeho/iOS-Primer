import UIKit

/*
 题目：给定一组非负整数，重新排列它们的顺序使之组成一个最大的整数。
 
 示例：
 输入：[10,2]
 输出：210
 
 时间复杂度：O(nlogn) 空间复杂度：O(nlogn)
 */

// 字符串数组排序
func largestNumber(_ nums: [Int]) -> String {
    var nums = nums.map { (num) -> String in
        return String(num)
    }
    
    nums = nums.sorted { (num1, num2) -> Bool in
        return num1 + num2 > num2 + num1
    }
    
    if nums.count > 0 {
        if (nums[0] as NSString).isEqual(to: "0") {
            return "0"
        }
    }
    
    return (nums as NSArray).componentsJoined(by: "")
}

print(largestNumber([10,2]))
