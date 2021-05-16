import UIKit

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}

struct Square: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for _ in 1...size {
            result.append(String(repeating: "*", count: size))
        }
        return result.joined(separator: "\n")
    }
}

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let result = shape.draw().split(separator: "\n")
        return result.reversed().joined(separator: "\n")
    }
}

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

//func makeTapezoid() -> JoinedShape<Triangle, JoinedShape<Square, FlippedShape<Triangle>>> {
// 返回不透明类
// opaque 类型是指一种特定类型,协议类型可以指代符合协议的任何类型
func makeTapezoid() -> some Shape {
    let t = Triangle(size: 3)
    let s = Square(size: 3)
    let f = FlippedShape(shape: t)
    return JoinedShape(top: t, bottom: JoinedShape(top: s, bottom: f))
}

let tapezoid = makeTapezoid()
print(tapezoid.draw())

protocol Container {
    associatedtype Item
    var count: Int {get}
    subscript(index: Int) -> Item {get}
}

extension Array: Container {}

//func makeProtocolContainer<T>(item: T) -> Container {
//    return[item]
//}

func makeProtocolContainer<T>(item: T) -> some Container {
    return[item]
}
