import UIKit

/*
 题目：给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
 
 
 示例：
 输入：给出 n = 3，生成结果为：
 输出：
 [
    "((()))",
    "(()())",
    "(())()",
    "()(())",
    "()()()"
 ]
 
 **时间复杂度：O(2<sup>n</sup>) 空间复杂度：O(n)**
 */

var list = [String]()
func _gen(_ left: Int, _ right: Int, _ n: Int, _ result: String) {
    if left == n && right == n {
        list.append(result)
        return
    }
    if left < n {
        _gen(left + 1, right, n, result + "(")
    }
    if left > right && right < n { // 右括号数量不能多余左括号数量
        _gen(left, right + 1, n, result + ")")
    }
}

func generateParenthesis(_ n: Int) -> [String] {
    if n <= 0 {
        return []
    }
    _gen(0, 0,  n, "")
    return list
}

print(generateParenthesis(3))
