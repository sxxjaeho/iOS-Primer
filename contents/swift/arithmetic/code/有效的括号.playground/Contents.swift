import UIKit

/*
 题目：给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 1.左括号必须用相同类型的右括号闭合。
 2.左括号必须以正确的顺序闭合。
 
 注意空字符串可被认为是有效字符串。
*/

func isValid(_ string: String) -> Bool {
    var stack = [Character]()
    // 如果栈顶是左括号,以当前遍历的字符为 key,找出 value 就是左括号 √
    let dictionary = [")": "(", "]": "[", "}": "{"]
    
//    // 如果栈顶是左括号,以当前遍历的字符为 value,找出 key 就是左括号
//    let dictionary1 = ["(": ")", "[": "]", "{": "}"]
    
    for character in string {
        if !dictionary.keys.contains(String(character)) { // 左括号
            stack.append(character)
        } else if !(!stack.isEmpty && String(stack.popLast()!) == dictionary[String(character)]) { // 栈顶元素是否与左括号匹配
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

