import UIKit

// 题目：请实现一个函数，把字符串中的每个空格替换成"%20"。例如输入“We are happy.”，则输出“We%20are%20happy.”

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

let string = "We are happy."
print(replaceBlank(string) ?? "")
