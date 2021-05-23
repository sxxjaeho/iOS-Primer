import UIKit

/*
 题目：输入一个字符串，打印出该字符串中字符的所有排列。
 
 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。
 
 示例：
 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]
 
 时间复杂度：O(N!N) 空间复杂度：0(N²)
 */

func permutation(_ s: String) -> [String] {
    var c = [Character](s), res = [String]()
    func dfs(_ x: Int) {
        print("|||||||||\(x)")
        if x == c.count - 1 {
            print(String(c))
            res.append(String(c))
            return
        }
        var set = Set<Character>()
        for i in x..<c.count {
            print("---------\(i),\(x)")
            if set.contains(c[i]) {
                continue    // 重复，因此剪枝
            }
            set.insert(c[i])
            c.swapAt(i, x); // 交换，将 c[i] 固定在第 x 位
            print("发生交换\(String(c))")
            dfs(x + 1);     // 开启固定第 x + 1 位字符
            c.swapAt(i, x)  // 恢复交换
            print("恢复交换\(String(c))")
        }
    }
    dfs(0)
    return res
}

print(permutation("abc"))
    
//   ↗  b  →  c   abc
// a
//   ↘  c  →  b   acb
//
//   ↗  a  →  c   bac
// b
//   ↘  c  →  a   bca

// for循环i=1,x=0
// abc,交换a,b得到bac
// 交换a,a得到bac,输出bac,恢复到bac
// 交换a,c得到bca,输出bca,恢复到bac
// 恢复到abc

