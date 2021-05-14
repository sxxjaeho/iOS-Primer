import UIKit

/*
 题目：请实现一个函数，把字符串中的每个空格替换成"%20"。例如输入“We are happy.”，则输出“We%20are%20happy.”
 
 示例：
 输入：s = "We are happy."
 输出："We%20are%20happy."
 */

func replaceBlank(_ string: String) -> String? {
    let characters = Array(string)
    guard characters.count != 0 else {
        return nil
    }
    
    var numberOfBlank = 0
    for character in characters {
        if character == " " {
            numberOfBlank += 1
        }
    }
    
    if numberOfBlank == 0 {
        return string
    }
    
    let newLength = characters.count + numberOfBlank * 2
    
    var indexOfOriginal = characters.count - 1
    var indexOfNew = newLength - 1
    
    var resultArray = [Character](repeating: " ", count: newLength)
    
    while indexOfOriginal >= 0 {
        
        let start = string.index(string.startIndex, offsetBy: indexOfOriginal)
        let end = string.index(string.startIndex, offsetBy: indexOfOriginal + 1)
        let character = Character(String(string[start..<end]))
        
        if character == " " {
            resultArray[indexOfNew-2...indexOfNew] = ["%", "2", "0"]
            indexOfNew -= 2
        } else {
            resultArray[indexOfNew] = character
        }
        
        indexOfOriginal -= 1
        indexOfNew -= 1
    }
    
    return String(resultArray)
}

func replaceBlank1(_ s: String) -> String {
    return s.replacingOccurrences(of: " ", with: "%20")
}

// 时间复杂度：O(n)。遍历字符串 s 一遍。
// 空间复杂度：O(n)。额外创建字符数组，长度为 s 的长度的 3 倍。
func replaceBlank2(_ s: String) -> String {
    if(s.count == 0) {
        return ""
    }
    var res = ""
    for ch in s {
        if(ch == " "){
            res.append("%20")
        } else {
            res.append(ch)
        }
    }
    return res
}

let string = "We are happy."
print(replaceBlank(string) ?? "")
