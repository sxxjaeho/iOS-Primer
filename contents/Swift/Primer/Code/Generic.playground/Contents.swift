import UIKit

var str = "Hello, playground"

//// MARK: - 泛型函数
//// 泛型函数定义
//func swaoTwoValues<T>(_ a: inout T, _ b: inout T) {
//    let temporaryA = a
//    a = b
//    b = temporaryA
//}


//// MARK: - 泛型类型
//// 泛型Stack
//struct Stack<Element> {
//    var items = [Element]()
//    mutating func push(_ item: Element) {
//        items.append(item)
//    }
//    mutating func pop() -> Element {
//        return items.removeLast()
//    }
//}
//
//var stackOfString = Stack<String>()
//stackOfString.push("uno")
//stackOfString.push("dos")
//
//// 扩展泛型类型
//extension Stack {
//    var topItem: Element? {
//        return items.isEmpty ? nil : items[items.count - 1]
//    }
//}
//print(stackOfString.topItem ?? "")


//// MARK: - 类型约束
//func findIndex(of valueToFind : String, in array: [String]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
//let names = ["zhangsan", "lisi", "wangwu"]
//print(findIndex(of: "lisi", in: names) as Any)
//
//// 类型约束语法
//func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
//    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
//let names1 = ["zhangsan", "lisi", "wangwu"]
//print(findIndex(of: "lisi", in: names1) as Any)
//
//let integers1 = [1, 3, 5]
//print(findIndex(of: 1, in: integers1) as Any)


//// MARK: - 关联类型
//// 协议不允许有泛型参数，为协议指定泛型必须使用关联类型
//protocol Container {
//    associatedtype Item
////    associatedtype Item: Equatable // 你可以在协议里给关联类型添加约束来要求遵循的类型满足约束
//
//    mutating func append(_ item: Item)
//    var count: Int { get }
//    subscript(i: Int) -> Item { get }
//}
//
//struct IntStack: Container {
//    var items = [Int]()
//
//    typealias Item = Int
//
//    mutating func append(_ item: Int) {
//        items.append(item)
//    }
//
//    var count: Int {
//        return items.count
//    }
//
//    subscript(i: Int) -> Int {
//        return items[i]
//    }
//}
//
//var intStack = IntStack()
//intStack.append(1)
//intStack.append(2)
//print(intStack.count)
//print(intStack[0])
//
//// 在关联类型约束里使用协议
//protocol SuffixableContainer: Container {
//    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
//    func suffix(_ size: Int)
//}
//
//
//// MARK: - 泛型 where 子句
//func allItemsMatch<C1: Container, C2: Container>(container: C1, anotherContaner: C2) -> Bool where C1.Item == C2.Item, C1.Item : Equatable {
//    if container.count != anotherContaner.count {
//        return false
//    }
//    for i in 0..<container.count {
//        if container[i] != anotherContaner[i] {
//            return false
//        }
//    }
//    return true
//}
//
//
//// MARK: - 泛型下标
//extension Container {
//    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
//        var result = [Item]()
//        for index in indices {
//            result.append(self[index])
//        }
//        return result
//    }
//}
//print(intStack[[0, 1]])


// MARK: - 泛型编程思维
