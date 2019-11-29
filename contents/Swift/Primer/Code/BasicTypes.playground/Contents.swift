import UIKit

//let maxNumberLogin = 10
//var currentNumberLoginAttemp = 0

//错误 常亮不能赋值
//maxNumberLogin = 9
//currentNumberLoginAttemp = 1

//let x = 0.0, y = 0.0, z = "123"
//print("x = \(x) y = \(y) z = \(z)")

//变量名可用特殊i字符
//let π = 3.14
//print(π)
//let ab = "abc"
//let a = 8

//小于255
//let b:UInt8 = 240
//print("UInt8 min\(UInt8.min) max\(UInt8.max)")

//let i = 1
//if i == 1 {
//    print(i)
//}

//typealias AudioSample = UInt8
//let sample : AudioSample = 32

//元组
//let error = (1, "没有权限")
//print(error)
//
//print(error.0)
//print(error.1)
//let 不可变
//let error = (errorCode:1, errorMessage:"没有权限")
//print(error.errorCode)
//print(error.errorMessage)
//var  可变
//var error = (errorCode:1, errorMessage:"没有权限")
//error.errorCode = 2
//print(error)
//元组元素不可修改类型 值可以修改
//error.errorMessage = 3(错误)
//此种情况可以更改元组中元素类型
//var error:(errorCode:Int, errorMessage:Any) = (errorCode:1, errorMessage:3)
//error.errorMessage = 3
//print(error)

//元组分解
//var error = (1, "没有权限")
//let (errorCode, errorMessage) = error
//print(errorCode)
//print(errorMessage)

//元组作为返回值
//func writeFile(content:String) -> (errcode:Int, errMessage:String){
//    return (1, "没有权限")
//}
//let error = writeFile(content: "")
//print(error)


//let str: String? = "abc"
//判断
//if str != nil {
//    let count = str!.count
//    print(count)
//}
//绑定
//if let actualStr = str {
//    let count = actualStr.count
//    print(count )
//}

//强制展开  必须保证不为空 如果为nil会报错
//let count = str!.count

//隐式展开
//let str:String! = "abc"
//let count = str.count

//绑定方式 Optional<String> 和 String?一样
//let str: Optional<String> = "abc"
//if let actualStr = str{
//    let count = actualStr.count
//    print(count)
//}

//str.unsafelyUnwrapped 和 str! 一样
//if str != nil {
//    let count = str.unsafelyUnwrapped.count
//    print(count)
//}


//字符串
//两种方法
//let emptyStr = ""
//let emptyStr = String()
//if emptpStr.isEmpty {
//    print("emptyStr 为空")
//}


//不需要换行加\  和末尾双引号不对齐会空格
//let numbers = """
//
//1\
//2\
//3
//    4
//5
//
//"""
//print(numbers)

//扩展字符串分割符 # 使特殊字符不生效
////前后加#  特殊符号无作用 中间加和两边同等数量#号 生效
//let str = #"1\#n2\n3"#
//let str1 = ##"1\##n2\n3"##
//print(str1)
////如果中间有双引号加# 两边多填#
//let str2 = ##"1\"#n2\n3"##
//print(str2)

//let welcome = "hello"
//var welcome1 = "hello"
////welcome += "world"//错误  不可变
//welcome1 += " world"
//print(welcome1)

//var welcome = "hello"
//var welcome1 = welcome
//welcome1.append(",")
//for c in welcome{
//    print(c)
//}

//let str = "6 * 7 = \(6 * 7)"
//print(str)
//let str1 = #"6 * 7 = \#(6 * 7)"#
//print(str1)

//var welcome = "hello"
//print(welcome[welcome.startIndex])
//print(welcome[welcome.index(before: welcome.endIndex)])

////插入单个字符
//welcome.insert("!", at: welcome.endIndex)
//
////插入字符串
//welcome.insert(contentsOf: " world", at: welcome.index(before: welcome.endIndex))
//
////删除
//welcome.remove(at: welcome.index(before: welcome.endIndex))
//
////移除部分
//let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
//welcome.removeSubrange(range)
//print(welcome)

let welcome = "Hello, world"
//没有, 逗号用endIndex
let index = welcome.index(of: ",") ?? welcome.endIndex
let subString = welcome[..<index]
let newString = String(subString)
print(subString)

let welcome1 = "Hello"
print(welcome1 == welcome)
print(welcome.hasPrefix("Hello"))
print(welcome.hasSuffix("world"))
