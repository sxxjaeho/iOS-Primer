import UIKit

var str = "Hello, playground"

//// MARK: - 协议
//// 协议的语法
//protocol Named {
//    var name: String { get }
//
//}
//
//protocol Aged {
//    var age: Int { get }
//}
//
//struct Person: Named, Aged {
//    var name: String
//    var age: Int
//}
//
//let p = Person(name: "zhangsan", age: 20)
//
//// 将协议作为类型
//// 协议组合
//func wish(to: Named & Aged) {
//    print("name \(to.name) age \(to.age)")
//}
//wish(to: p)


//// MARK: - 协议 and 扩展
//// 在扩展里添加协议遵循
//struct Person {
//    var name: String
//    var age: Int
//}
//
//protocol TextRepresentable {
//    var desc: String { get }
//}
//
//extension Person: TextRepresentable {
//    var desc: String {
//        return "name \(name) age \(age)"
//    }
//}
//let p = Person(name: "zhangsan", age: 20)
//print(p.desc)
//
//// 使用扩展声明采纳协议
//struct Person1 {
//    var name: String
//    var age: Int
//    var desc: String {
//        return "name \(name) age \(age)"
//    }
//}
//
//// 有条件地遵循协议
//extension Array: TextRepresentable where Element: TextRepresentable {
//    var desc: String {
//        let itemDesc = self.map { $0.desc }
//        return itemDesc.joined(separator: ",")
//    }
//}
//let array = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 30)]
//print(array.desc)
//
//let intArray = [1, 2, 3]
////print(intArray.desc) // intArray 的元素没有遵循 TextRepresentable 协议
//
//extension Person1: TextRepresentable {}
//
//// 协议扩展
//extension Collection where Iterator.Element: TextRepresentable {
//    var desc: String {
//        let itemDesc = self.map { $0.desc }
//        return itemDesc.joined(separator: ",")
//    }
//}
//let array1 = [Person(name: "zhangsan", age: 20), Person(name: "lisi", age: 30)]
//print(array1.desc)

