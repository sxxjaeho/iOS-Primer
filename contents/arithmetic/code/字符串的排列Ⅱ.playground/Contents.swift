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
        if x == c.count - 1 {
            res.append(String(c))
            print(res)
            return
        }
        var set = Set<Character>()
        for i in x..<c.count {
            if set.contains(c[i]) {
                continue    // 重复，因此剪枝
            }
            set.insert(c[i])
            c.swapAt(i, x); // 交换，将 c[i] 固定在第 x 位
            dfs(x + 1);     // 开启固定第 x + 1 位字符
            c.swapAt(i, x)  // 恢复交换
        }
    }
    dfs(0)
    return res
}

print(permutation("abc"))
