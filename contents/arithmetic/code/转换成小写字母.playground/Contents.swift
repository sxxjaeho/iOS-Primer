import UIKit

/*
 题目：实现函数 ToLowerCase()，该函数接收一个字符串参数 str，并将该字符串中的大写字母转换成小写字母，之后返回新的字符串。
 
 示例：
 输入: "Hello"
 输出: "hello"
 
 时间复杂度：O(n) 空间复杂度：O(n)
*/

func toLowerCase(_ str: String) -> String {
    return String(str.unicodeScalars.map { (s) -> Character in
        if s.value >= 65 && s.value <= 90 {
                return Character(UnicodeScalar(s.value + 32)!)
        }
        return Character(UnicodeScalar(s))
    })
}

// 大写的ASCII+32 = 小写的ASCII
// 用递归
func toLowerCase1(_ str: String) -> String {
    var arr = Array(str)
    var res = String()
    if arr.count <= 0 {
        return res
    } else {
        var char: Character = arr.first!
        if char >= "A" && char <= "Z" {
            char = (char.ascii + 32).ASCII
        }
        res.append(char)
        arr.removeFirst()
    }
    return res + toLowerCase(String(arr))
}

extension Character {
    var ascii: Int {
        get {
            let value = String(self).unicodeScalars
            return Int(value[value.startIndex].value)
        }
    }
}

extension Int {
    var ASCII: Character {
        get { return Character(UnicodeScalar(self)!)} }
}

print(toLowerCase1("Hello"))
