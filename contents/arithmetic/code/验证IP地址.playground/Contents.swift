import UIKit

/*
 题目：编写一个函数来验证输入的字符串是否是有效的 IPv4 或 IPv6 地址。
 
 IPv4 地址由十进制数和点来表示，每个地址包含4个十进制数，其范围为 0 - 255， 用(".")分割。比如，172.16.254.1；
 同时，IPv4 地址内的数不会以 0 开头。比如，地址 172.16.254.01 是不合法的。
 
 IPv6 地址由8组16进制的数字来表示，每组表示 16 比特。这些组数字通过 (":")分割。比如,  2001:0db8:85a3:0000:0000:8a2e:0370:7334 是一个有效的地址。而且，我们可以加入一些以 0 开头的数字，字母可以使用大写，也可以是小写。所以， 2001:db8:85a3:0:0:8A2E:0370:7334 也是一个有效的 IPv6 address地址 (即，忽略 0 开头，忽略大小写)。
 然而，我们不能因为某个组的值为 0，而使用一个空的组，以至于出现 (::) 的情况。 比如， 2001:0db8:85a3::8A2E:0370:7334 是无效的 IPv6 地址。
 同时，在 IPv6 地址中，多余的 0 也是不被允许的。比如， 02001:0db8:85a3:0000:0000:8a2e:0370:7334 是无效的。
 
 说明: 你可以认为给定的字符串里没有空格或者其他特殊字符。
 */

func validIPAddress(_ IP: String) -> String {
    if isValidIPv4(IP) {
        return "IPv4"
    } else if isValidIPv6(IP) {
        return "IPv6"
        
    } else {
        return "Neither"
    }
}

func isValidIPv4(_ IP: String) -> Bool {
    // 至少包含4个数字,3个"."
    if IP.count < 7 { return false }
    // 第一个不能是"."
    if IP[0] == "." { return false }
    // 最后一个不能是"."
    if IP[IP.count - 1] == "." { return false }
    
    // 以"."分割
    let component: [String] = IP.components(separatedBy: ".")
    // 需要4组
    if component.count != 4  { return false }
    for address in component {
        if !isValidIPv4Component(address) { return false }
    }
    return true
}

func isValidIPv4Component(_ component: String) -> Bool {
    // 每组不能以0开头,至少含一个数
    if component.hasPrefix("0") && component.count > 1 { return false }
    
    if let element = Int(component) {
        // 范围:0-255
        if element < 0 || element > 255 { return false }
        return true
    } else {
        return false
    }
}

//func isValidIPv41(_ IP: String) -> Bool {
//    let args = "((2[0-5][0-5]|1[0-9][0-9]|[1-9][0-9]|[0-9])\\.){3}(2[0-5][0-5]|1[0-9][0-9]|[1-9][0-9]|[0-9])"
//    let predicate = NSPredicate(format: "SELF MATCHES %@", args)
//    return  predicate.evaluate(with: IP)
//}

func isValidIPv6(_ IP: String) -> Bool {
    if IP.count < 15 { return false }
    if IP[0] == ":" { return false }
    if IP[IP.count - 1] == ":" { return false }
    let component: [String] = IP.components(separatedBy:":")
    if component.count != 8  { return false }
    for element in component {
        if !isValidIPv6Component(element) { return false }
    }
    return true
}

func isValidIPv6Component(_ component: String) -> Bool {
    if component.count == 0 || component.count > 4 { return false }
    
    for element in Array(component) {
        let isDigit: Bool = element.ascii >= 48 && element.ascii <= 57
        let isUppercase: Bool = element.ascii >= 65 && element.ascii <= 70
        let isLowercase: Bool = element.ascii >= 97 && element.ascii <= 102
        if !(isDigit || isUppercase || isLowercase) {
            return false
        }
    }
    return true
}

//func isValidIPv61(_ IP: String) -> Bool {
//    let args = "(([0-9]|[a-f]|[A-F]){1,4}:){7}(([0-9]|[a-f]|[A-F]){1,4})"
//    let predicate = NSPredicate(format: "SELF MATCHES %@", args)
//    return  predicate.evaluate(with: IP)
//}

extension String {
    subscript (_ i: Int) -> Character {
        get { return self[index(startIndex, offsetBy: i)] }
    }
}

extension Character {
    var ascii: Int {
        get {
            let value = String(self).unicodeScalars
            return Int(value[value.startIndex].value)
        }
    }
}

let IP1 = "172.16.254.1"
let IP2 = "2001:0db8:85a3:0:0:8A2E:0370:733"
let IP3 = "256.256.256.256"

print(validIPAddress(IP1))
print(validIPAddress(IP2))
print(validIPAddress(IP3))
