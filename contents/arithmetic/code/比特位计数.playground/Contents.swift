import UIKit

/*
 题目：给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。
 
 示例:
 输入: 2
 输出: [0,1,1]
 
 时间复杂度：O(num) 空间复杂度：O(1)
 */

// 按位与运算（&）的一个性质是：对于任意整数 x，令 x=x & (x−1)，该运算将 x 的二进制表示的最后一个 1 变成 0
//func countBits(_ num: Int) -> [Int] {
//    if num == 0 {
//        return [0]
//    }
//    var res = [Int](repeating: 0, count: num + 1)
//    for i in 1...num {
//        res[i] = countOnes(i)
//    }
//    return res
//}
//
//func countOnes(_ num: Int) -> Int {
//    var count = 0
//    var num = num
//    while num > 0 {
//        num &= (num - 1)
//        count += 1
//    }
//    return count
//}

// 动态规划——最低设置位
func countBits1(_ num: Int) -> [Int] {
    if num == 0 {
        return [0]
    }
    var res = [Int](repeating: 0, count: num + 1)
    for i in 1...num {
        // 清零最低位的1
        // 1.     res[1] = res[(0001 & 0000)] + 1 = 1
        // 2.     res[2] = res[(0010 & 0001)] + 1 = 1
        // 3.     res[3] = res[(0011 & 0010)] + 1 = 2
        // 4.     res[4] = res[(0100 & 0011)] + 1 = 1
        // 5.     res[5] = res[(0101 & 0100)] + 1 = 2
        res[i] = res[i & (i-1)] + 1
    }
    return res
}

// 动态规划——最高有效位
func countBits2(_ num: Int) -> [Int] {
    if num == 0 {
        return [0]
    }
    var res = [Int](repeating: 0, count: num + 1)
    var highBit = 0
    for i in 1...num {
        // 判断一个正整数是不是 2 的整数次幂，更新当前的最高有效位
        if ((i & (i - 1)) == 0) {
            highBit = i;
        }
        // 当前数的bit数为前一个数的bit数+1
        res[i] = res[i - highBit] + 1;
    }
    return res
}

print(countBits2(7))
