import UIKit

//// MARK: - 变量和常量
//let maxNumberLogin = 10
//var currentNumberLoginAttemp = 0
//
//// 错误(常亮不能赋值)
//maxNumberLogin = 9
//currentNumberLoginAttemp = 1
//
//// 打印常量和变量
//let x = 0.0, y = 0.0, z = "123"
//print("x = \(x) y = \(y) z = \(z)")
//
//// 变量和常量命名
//// 变量名可用特殊i字符
//let π = 3.14
//print(π)
//let ab = "abc"
//let a = 8


//// MARK: - 基本数据类型
//// 整数
//// 小于 255
//let b: UInt8 = 240
//print("UInt8 min\(UInt8.min) max\(UInt8.max)")
//
//// Bool
//let i = 1
//if i == 1 {
//    print(i)
//}
//
//// 类型别名
//typealias AudioSample = UInt8
//let sample : AudioSample = 32
//
//// 元组(Tuple)
//let error = (1, "没有权限")
//print(error)
//
//print(error.0)
//print(error.1)
//
//// let 不可变
//let error1 = (errorCode:1, errorMessage:"没有权限")
//print(error1.errorCode)
//print(error1.errorMessage)
//// var 可变
//var error2 = (errorCode:1, errorMessage:"没有权限")
//error2.errorCode = 2
//print(error)
//
//// 元组元素不可修改类型 值可以修改
////error2.errorMessage = 3
//// 此种情况可以更改元组中元素类型
//var error3: (errorCode:Int, errorMessage:Any) = (errorCode:1, errorMessage:3)
//error3.errorMessage = 3
//print(error)
//
//// 元组分解
//var error4 = (1, "没有权限")
//let (errorCode, errorMessage) = error4
//print(errorCode)
//print(errorMessage)
//
////元组作为返回值
//func writeFile(content:String) -> (errcode:Int, errMessage:String){
//    return (1, "没有权限")
//}
//let error5 = writeFile(content: "")
//print(error5)


//// MARK: - 可选类型(Optional)
//let str: String? = "abc"
//// Optional-If 语句以及强制展开
//if str != nil {
//    let count = str!.count
//    print(count)
//}
//// Optional-绑定
//if let actualStr = str {
//    let count = actualStr.count
//    print(count)
//}
//
//// 强制展开
//let count = str!.count // 必须保证不为空,如果为nil会报错
//
//// 隐式展开
//let str1: String! = "abc"
//let count1 = str1.count
//
//// Optional-实现探究
//// 绑定方式 Optional<String> 和 String?一样
//let str2: Optional<String> = "abc"
//if let actualStr = str2 {
//    let count2 = actualStr.count
//    print(count2)
//}
//
//// Optional-展开实现
////str.unsafelyUnwrapped // 和 str! 一样
//if str != nil {
//    let count = str.unsafelyUnwrapped.count
//    print(count)
//}


//// MARK: - 字符串-初始化
//// 初始化空串
//// 两种方法
//// 字面量
//let emptyStr = ""
//// 初始化器语法
//let emptyStr1 = String()
//
//if emptyStr.isEmpty {
//    print("emptyStr 为空")
//}
//
//// 多行字面量
//// 不需要换行加\  和末尾双引号不对齐会空格
//let numbers = """
////
////1\
////2\
////3
////    4
////5
////
////
//"""
//print(numbers)
//
//// 扩展字符串分隔符
//// # 使特殊字符不生效
//// 前后加 # 使特殊符号无作用
//let str = #"1\#n2\n3"#
//// 中间加和两边同等数量 # 号使特殊符号生效
//let str1 = ##"1\##n2\n3"##
//print(str)
//
//// 如果中间有 "#,则两边多填#
//let str2 = ##"1\"#n2\n3"##
//print(str2)


//// MARK: - 字符串-操作
//let welcome = "hello"
//var welcome1 = "hello"
////welcome += "world" // 错误(不可变)
//welcome1 += " world"
//print(welcome1)
//
//// 操作字符
//var welcome2 = "hello"
//var welcome3 = welcome2
//welcome1.append(",")
//for c in welcome{
//    print(c)
//}
//
//// 字符串插值
//let str3 = "6 * 7 = \(6 * 7)"
//print(str3)
//// 要在使用扩展分隔符的字符串中使用字符串插值,在反斜杠后使用匹配首尾 # 数量的#
//let str4 = #"6 * 7 = \#(6 * 7)"#
//print(str4)


//// MARK: - 字符串-访问和修改
//// 字符串索引
//var welcome4 = "hello"
//print(welcome4[welcome4.startIndex])
//print(welcome4[welcome4.index(before: welcome4.endIndex)])
//
//// 插入单个字符
//welcome4.insert("!", at: welcome4.endIndex)
//
//// 插入字符串
//welcome4.insert(contentsOf: " world", at: welcome4.index(before: welcome4.endIndex))
//
//// 删除
//welcome4.remove(at: welcome4.index(before: welcome4.endIndex))
//
//// 移除部分
//let range = welcome4.index(welcome4.endIndex, offsetBy: -6)..<welcome4.endIndex
//welcome4.removeSubrange(range)
//print(welcome4)


//// MARK: - 字符串-子串和字符串比较
//// 子字符串
//let welcome5 = "Hello, world"
//let index = welcome5.firstIndex(of: ",") ?? welcome5.endIndex
//let subString = welcome5[..<index]
//let newString = String(subString)
//print(subString)
//
//// 字符串比较
//let welcome6 = "Hello"
//print(welcome6 == welcome5)
//print(welcome6.hasPrefix("Hello"))
//print(welcome6.hasSuffix("world"))
//
//// 字符串反转
//fileprivate func _reverse<T>(_ chars: inout [T], _ start: Int, _ end: Int) {
//
//    var  start = start, end = end
//    while start < end {
//        _swap(&chars, start, end)
//        start += 1
//        end -= 1
//    }
//
//}
//
//fileprivate func _swap<T>(_ chars: inout [T], _ p: Int, _ q: Int) {
//    (chars[p], chars[q]) = (chars[q], chars[p])
//}
//
//var chars = Array(welcome6)
//_reverse(&chars, 0, 4)
//print(String(chars))
