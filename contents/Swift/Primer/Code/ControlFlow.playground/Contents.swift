import UIKit

//var str = "Hello, playground"
//
//for num in 0...3 {
//    print(num)
//}
//
//for c in "Hello world"{
//    print(c)
//}

//let names = ["zhangsan", "lisi", "wangwu"]
//for name in names{
//    print(name)
//}

//let numbersOfLeg = ["spider": 8, "ant": 6, "cat": 4]
//for t in numbersOfLeg {
//    print("\(t.0) has \(t.1) legs")
//}
//
//for (name, num) in numbersOfLeg{
//    print("\(name) has \(num) legs")
//}

////区间循环
////from:起点 包含 to:终点 不包含 by:步长
//for i in stride(from: 0, to: 50, by: 5){
//    print(i)
//}
////through包含
//for i in stride(from: 0, through: 50, by: 5){
//    print(i)
//}

//let c:Character = "z"
//switch c {
//case "a":
//    print("the first letter")
//case "z":
//    print("the last letter")
//default:
//    print("其他")
//}
//
//let c2 = "a"
//switch c2 {
//case "a", "e", "i", "o", "u":
//    print("元音字母")
//case "b", "c", "d":
//    print("辅音字母")
//default:
//    print("其他")
//}

//let count = 12
//switch count {
//case 0:
//    print("none")
//case 1...5:
//    print("a few")
//case 6..<12:
//    print("several")
//case 12..<100:
//    print("hundred of")
//default:
//    print("many")
//}

//let point = (1,1)
//switch point {
//case (0,0):
//    print("原点")
//case (_, 0):
//    print("y轴")
//case (0, _):
//    print("x轴")
//case (-2...2, -2...2):
//    print("在区域内")
//default:
//    print("在区域外")
//}

//let point = (0, 1)
//switch point {
//case (let x, 1):
//    print("y是1时x的值是\(x)")
//case (1, let y):
//    print("x是1时y的值是\(y)")
//default:
//    print("其他")
//}

//let point = (1,-1)
//switch point {
//case (let x, let y) where x == y:
//    print("x和y相等")
//case (let x, let y) where x == -y:
//    print("x和y相反")
//default:
//    print("其他")
//}

//let num = 5
//var describe = "\(num) is "
//switch num {
//case 2,3,5,7,11,13:
//    describe += "sushu "
//    fallthrough
//default:
//    describe += "also zhengshu"
//}
//print(describe)

//var num = 10
//whileLoop:while num > 0 {
//    switch num {
//    case 9:
//        print("9")
//    case 10:
//        var sum = 0
//        for i in 0...10 {
//            sum += i
//            if i == 9 {
//                print(sum)
//                break whileLoop
//            }
//        }
//    default:
//        print("default \(num)")
//    }
//    num -= 1
//}

//func checkIPAddress (ipAdd: String) -> (Int, String){
//    let compoments = ipAdd.split(separator: ".")
//
//    if compoments.count == 4 {
//        if let first = Int(compoments[0]), first >= 0 && first < 256 {
//            if let second = Int(compoments[1]), second >= 0 && second < 256 {
//                if let third = Int(compoments[2]), third >= 0 && third < 256 {
//                    if let fourth = Int(compoments[3]), fourth >= 0 && fourth < 256 {
//                        return (10001, "正确")
//                    } else {
//                        return (4, "4不对")
//                    }
//                } else {
//                    return (3, "3不对")
//                }
//            } else {
//                return (2, "2不对")
//            }
//        } else {
//            return (1, "1不对")
//        }
//    } else {
//        return (100, "ip不对")
//    }
//}
//print(checkIPAddress(ipAdd: "192.168.1.54"))

//func checkIPAddress2 (IPAdd: String) -> (Int, String) {
//    let components = IPAdd.split(separator: ".")
//
//    guard components.count == 4 else {
//        return (100, "ip不正确")
//    }
//    guard let first = Int(components[0]), first >= 0 && first < 256 else {
//        return (1, "第一部分不正确")
//    }
//    guard let second = Int(components[1]), second >= 0 && second < 256 else {
//        return (2, "第二部分不正确")
//    }
//    guard let third = Int(components[2]), third >= 0 && third < 256 else {
//        return (3, "第三部分不正确")
//    }
//    guard let fourth = Int(components[3]), fourth >= 0 && fourth < 256 else {
//        return (4, "第四部分不正确")
//    }
//    return (10001, "IP正确")
//}
//print(checkIPAddress2(IPAdd: "192.1222.0.11"))

//可选项模式
//let someNum: Int? = 10
//if case .some(let x) = someNum{
//    print(x)
//}

//if case let x? = someNum{
//    print(x)
//}

//类型转换模式
//protocol Animal{
//    var name:String {get}
//}
//
//struct Dog : Animal{
//    var name: String{
//        return "dog"
//    }
//    var runSpeed:Int
//}
//
//struct Bird : Animal{
//    var name: String{
//        return "bird"
//    }
//    var flyHeight:Int
//}
//
//struct Fish : Animal{
//    var name: String{
//        return "fish"
//    }
//    var depth:Int
//}

//as 有返回值 is没有返回值
//let animals : [Any] = [Dog(runSpeed: 40), Bird(flyHeight: 500), Fish(depth: 90)]
//for animal in animals {
//    switch animal {
//    case let dog as Dog:
//        print("\(dog.name) run \(dog.runSpeed)")
//    case let bird as Bird:
//        print("\(bird.name) fly \(bird.flyHeight)")
//    case is Bird:
//        print("Bird can fly")
//    default:
//        break
//    }
//}

//表达式模式  自定义~=区间匹配
//自定义结构体
struct Employee {
    var salary:Int
}
func ~= (left:ClosedRange<Int>, right:Employee) -> Bool{
    return left.contains(right.salary)
}
var e: Employee = Employee(salary: 2000)

    switch e {
    case 0...1000:
        print("不够")
    case 1000...2000:
        print("勉强")
    case 2000...5000:
        print("高薪")
    default:
        print("奢华")
    }
