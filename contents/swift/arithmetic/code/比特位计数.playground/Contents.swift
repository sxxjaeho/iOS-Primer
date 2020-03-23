import UIKit

// 题目：给定一个非负整数 num。对于 0 ≤ i ≤ num 范围中的每个数字 i ，计算其二进制数中的 1 的数目并将它们作为数组返回。

func countBits(_ num: Int) -> [Int] {
    if num == 0 {
        return [0]
    }
    var res = [Int](repeating: 0, count: num + 1)
    for i in 1...num {
        // 清零最低位的1
        // 1.     res[1] = res[(0001 => 0000)] + 1 = 1
        // 2.     res[2] = res[(0010 => 0000)] + 1 = 1
        // 3.     res[3] = res[(0011 => 0010)] + 1 = 2
        // 4.     res[4] = res[(0100 => 0000)] + 1 = 1
        // 5.     res[5] = res[(0101 => 0100)] + 1 = 2
        res[i] += res[i & (i-1)] + 1
    }
    return res
}

print(countBits(5))
