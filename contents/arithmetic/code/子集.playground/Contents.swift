import UIKit

/*
 给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。

 解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。

 示例：
 输入：nums = [1,2,3]
 输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

 时间复杂度：O(nx2^n) 空间复杂度：O(n)
 */
func subsets(_ nums: [Int]) -> [[Int]] {
    
    var result = [[Int]]()
    for i in nums {
        let item = [i]
        for itemArr in result {
            result.append(itemArr + item)
        }
        result.append(item)
    }
    result.append([])
    return result
    
}
