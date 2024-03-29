import UIKit

/*
 题目：给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。
 
 时间复杂度：O(max(len1, len2)) 空间复杂度：O(1)
 */


// 类似竖式计算
func addStrings(_ num1: String, _ num2: String) -> String {
    var result = ""
    var i = num1.count - 1
    var j = num2.count - 1
    var add = 0
    while i >= 0 || j >= 0 {
        var x = 0
        if i >= 0 {
            x = Int(String(Array(num1)[i])) ?? 0
        }
        var y = 0
        if j >= 0 {
            y = Int(String(Array(num2)[j])) ?? 0
        }
        let sum = x + y + add
        result = String(sum % 10) + result
        add = sum / 10
        i -= 1
        j -= 1
    }
    if add == 1 {
        result = "1" + result
    }
    return result
}

//func addStrings(_ num1: String, _ num2: String) -> String {
//    var num1 = num1
//    var num2 = num2
//    var result = ""
//    var add = 0
//    while !num1.isEmpty || !num2.isEmpty {
//        var x = 0
//        if !num1.isEmpty {
//            x = Int(String(num1.removeLast())) ?? 0
//        }
//        var y = 0
//        if !num2.isEmpty {
//            y = Int(String(num2.removeLast())) ?? 0
//        }
//        let sum = x + y + add
//        result = String(sum % 10) + result
//        add = sum / 10
//    }
//    if add == 1 {
//        result = "1" + result
//    }
//    return result
//}

//func addStrings(_ num1: String, _ num2: String) -> String {
//    let num1 = [Character](num1)
//    let num2 = [Character](num2)
//    var result = ""
//    var i = num1.count - 1
//    var j = num2.count - 1
//    var add: UInt8 = 0
//    while i >= 0 || j >= 0 {
//        var x: UInt8 = 0
//        if i >= 0 {
//            x = num1[i].asciiValue! - Character("0").asciiValue!
//        }
//        var y: UInt8 = 0
//        if j >= 0 {
//            y = num2[j].asciiValue! - Character("0").asciiValue!
//        }
//        let sum = x + y + add
//        result = String(sum % 10) + result
//        add = sum / 10
//        i -= 1
//        j -= 1
//    }
//    if add == 1 {
//        result = "1" + result
//    }
//    return result
//}

print(addStrings("1", "99"))
