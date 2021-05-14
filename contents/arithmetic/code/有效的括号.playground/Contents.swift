import UIKit

/*
 题目：给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 1.左括号必须用相同类型的右括号闭合。
 2.左括号必须以正确的顺序闭合。
 
 注意空字符串可被认为是有效字符串。
 
 时间复杂度：O(n)，其中 n 是字符串 s 的长度 空间复杂度：O(n+∣Σ∣)，其中 Σ 表示字符集，本题中字符串只包含 6 种括号，∣Σ∣=6。栈中的字符数量为 O(n)，而哈希表使用的空间为 O(∣Σ∣)，相加即可得到总空间复杂度。
*/

func isValid(_ string: String) -> Bool {
    var stack = [Character]()
    // 如果栈顶是左括号,以当前遍历的字符为 key,找出 value 就是左括号 √
    let dictionary = [")": "(", "]": "[", "}": "{"]
    
//    // 如果栈顶是右括号,以当前遍历的字符为 value,找出 key 就是左括号
//    let dictionary1 = ["(": ")", "[": "]", "{": "}"]
    
    for character in string {
        if !dictionary.keys.contains(String(character)) { // 左括号
            stack.append(character)
        } else if !(!stack.isEmpty && String(stack.popLast()!) == dictionary[String(character)]) { // 栈顶元素是否与左括号匹配
            print(stack)
            return false
        }
    }
    return stack.isEmpty
}

print(isValid("()"))
print(isValid("()[]{}"))
print(isValid("(]"))
print(isValid("([)]"))
print(isValid("{[]}"))

