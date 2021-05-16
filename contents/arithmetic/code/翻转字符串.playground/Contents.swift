import UIKit

/*
 题目：输入一个英文句子，翻转句子中单词的顺序，但单词内字符的顺序不变。为简单起见，标点符号和普通字母一样处理。例如输入字符串"I am a student."，则输出"student. a am I"。
 
 时间复杂度：O(n) 空间复杂度：O(1)
 */

func reverseWords(_ sentence: String) -> String {
    if sentence.isEmpty {
        return ""
    }
    // 整理字符串,出去多余的" "
    var chars = Array(trimmingCharacters(sentence))
    var start = 0
    reverse(&chars, 0, chars.count - 1)
    for i in 0...chars.count - 1 {
        if i == chars.count - 1 || chars[i + 1] == " " {
            reverse(&chars, start, i)
            start = i + 2
        }
    }
    return String(chars)
}

func trimmingCharacters(_ s: String) -> String {
    return s.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces).filter { $0 != "" }.joined(separator: " ")
}

func reverse(_ chars: inout Array<Character>, _ begin: Int, _ end: Int) {
    var begin = begin
    var end = end
    
    while begin < end {
        chars.swapAt(begin, end)
        begin += 1
        end -= 1
    }
}

print(reverseWords("  hello  world  "))

func reverseWords1(_ sentence: String) -> String {
    return sentence.split { $0.isWhitespace }.reversed().joined(separator: " ")
}

print(reverseWords1("  hello  world  "))
