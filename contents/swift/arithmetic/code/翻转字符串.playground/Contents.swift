import UIKit

// 题目：输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student."，则输出"student. a am I"。

func reverse<T> (_ chars: inout Array<T>, _ begin: Int, _ end: Int) {
    var begin = begin
    var end = end
    
    while begin < end {
        chars.swapAt(begin, end)
        begin += 1
        end -= 1
    }
}

func reverseSentence(_ sentence: String?) -> String? {
    guard let sentence = sentence else {
        return nil
    }
    var chars = Array(sentence)
    var start = 0
    reverse(&chars, 0, chars.count - 1)
    for i in 0..<chars.count - 1 {
        if i == chars.count - 1 || chars[i + 1] == " " {
            reverse(&chars, start, i)
            start = i + 2
        }
    }
    return String(chars)
}

print(reverseSentence("I am a student.") ?? "")

