import UIKit

/*
 题目：有一个整数数组，请你根据快速排序的思路，找出数组中第K大的数。
 给定一个整数数组a,同时给定它的大小n和要找的K(K在1到n之间)，请返回第K大的数，保证答案存在。
 
 示例：
 输入：[1,3,5,2,2],5,3
 输出：2
 
 时间复杂度：O(nlogn)) 空间复杂度：O(logn)
 */

func findKth ( _ a: [Int],  _ n: Int,  _ K: Int) -> Int {
    let sorted = a.sorted()
    return sorted[n-K]
}
