import UIKit

var str = "Hello, playground"

//// MARK: - 增强的枚举
//// 枚举语法
//enum CompassPoin {
//    case sourth
//    case north
//    case east
//    case west
//}
//
//// 使用 Switch 语句来匹配枚举值
//let direction = CompassPoin.sourth
//switch direction {
//case .sourth:
//    print("sourth")
//case .north:
//    print("north")
//case .east:
//    print("east")
//case .west:
//    print("west")
//}
//
//// 遍历枚举的 case
//enum CompassPoin1 : CaseIterable {
//    case sourth
//    case north
//    case east
//    case west
//}
//print(CompassPoin1.allCases.count)
//
//// 关联值
//enum Barcode {
//    case upc(Int, Int, Int, Int) // (Int, Int, Int, Int)为关联值
//    case qrCode(String)
//}
//var productCode = Barcode.upc(1, 2, 3, 4)
//print(productCode)
////productCode = .qrCode("ABCDEFG")
////print(productCode)
//
//switch productCode {
//case .upc(let a, let b, let c, let d):
//    print("upc-\(a)-\(b)-\(c)-\(d)")
//case .qrCode(let codeString):
//    print("qrce-\(codeString)")
//}
//
//// 原始值
//enum ControlCharacter: String {
//    case tab = "\t"
//    case line = "\n"
//}
//print(ControlCharacter.tab.rawValue)
//
//// 预设原始值
//enum Planet: Int {
//    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
//}
//
//// 从原始值初始化
//let possiblePlanet = Planet(rawValue: 7)
//
//let positionToFind = 11
//if let somePlanet = Planet(rawValue: positionToFind) {
//    switch somePlanet {
//    case .earth:
//        print("Mostly harmless")
//    default:
//        print("Not a safe place for humans")
//    }
//} else {
//    print("There isn't a planet at position \(positionToFind)")
//}
//
//// 递归枚:递归枚举是拥有另一个枚举作为枚举成员关联值的枚举。当编译器操作递归枚举时必须插入间 接寻址层。你可以在声明枚举成员之前使用 indirect关键字来明确它是递归的
//indirect enum ArithmenticExpression {
//    case number(Int)
//    case addition(ArithmenticExpression, ArithmenticExpression)
//    case multiplication(ArithmenticExpression, ArithmenticExpression)
//}
//let five = ArithmenticExpression.number(5)
//let four = ArithmenticExpression.number(4)
//let sum = ArithmenticExpression.addition(five, four)
//let product = ArithmenticExpression.multiplication(sum, ArithmenticExpression.number(2))
//print(product)
//
//// 执行函数
//func evaluate(_ expression: ArithmenticExpression) -> Int {
//    switch expression {
//    case let .number(value): // case .number(let value)
//        return value
//    case let .addition(left, right):
//        return evaluate(left) + evaluate(right)
//    case let .multiplication(left, right):
//        return evaluate(left) * evaluate(right)
//    }
//}
//print("计算结果:\(evaluate(product))")


//// MARK: - 添加属性
//struct Point {
//    var x: Int = 0
//    var y: Int = 0
//}
//
//struct Size {
//    var width = 0
//    var height = 0
//}
//
//struct Rect {
//    // 存储属性
//    var origin: Point
//    var size: Size
//    // 计算属性
//    var center: Point {
//        get {
//            return Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
//        }
//        set(newCenter) {
//            origin.x = newCenter.x - size.width / 2
//            origin.y = newCenter.y - size.height / 2
//        }
//    }
//}
//
//struct Rect1 {
//    var origin: Point
//    var size: Size
//    var center: Point {
//        get {
//            // 简写 getter
//            Point(x: origin.x + size.width / 2, y: origin.y + size.height / 2)
//        }
//        set {
//            // 简写 setter
//            origin.x = newValue.x - size.width / 2
//            origin.y = newValue.y - size.height / 2
//        }
//    }
//
//}
//
//// 只读计算属性
//
//// 属性观察者
//// willSet 会在该值被存储之前被调用
//// didSet 会在一个新值被存储后被调用
//class StepCounter {
//    var totalSteps: Int = 0 {
//        willSet(newSteps) {
//            print("will set totalSteps to \(newSteps)")
//        }
//        didSet(oldSteps) {
//            print("did change totalSteps from \(oldSteps) to \(totalSteps)")
//        }
//    }
//}
//
//class StepCounter1 {
//    var totalSteps: Int = 0 {
//        willSet {
//            print("will set totalSteps to \(newValue)")
//        }
//        didSet {
//            print("did change totalSteps from \(oldValue) to \(totalSteps)")
//        }
//    }
//}
//
//var counter = StepCounter()
//counter.totalSteps = 100
//counter.totalSteps = 360
//counter.totalSteps = 912
//
//// 全局和局部变量
//var count: Int = 0 {
//    willSet {
//        print("will set count to \(newValue)")
//    }
//    didSet {
//        print("didi change count from \(oldValue) to \(count)")
//    }
//}
//count = 10
//
//// 类型属性
//// 上述存储属性和计算属性都归属于实例。使用 static 关键字来定义类型属性。对于类类型的计算类型属性，你可以使用 class 关键字 来允许子类重写父类的实现
//class SomeClass {
//    static var storedTypeProperty = "Some value"
//    static var computedTypeProperty: Int {
//        return 27
//    }
//    class var overrideableComutedTypeProperty: Int {
//        return 107
//    }
//}


//// MARK: - 添加方法
//struct Point {
//    var x = 0.0
//    var y = 0.0
//    // 实例方法
//    func printInfo() {
//        print("x is \(x), y is \(y)")
//    }
//    // 类型方法
//    static func printTypeInfo() {
//        print("A Poin")
//    }
//
//
//}
//
//var p = Point(x: 2.0, y: 2.0)
//p.printInfo()
////Point.printTypeInfo()
//
//
//// 实例方法-self
//struct Point1 {
//    var x = 0.0
//    var y = 0.0
//
//    func isToTheRightOf(x: Double) -> Bool {
//        return self.x > x
//    }
//}
//let p1 = Point1(x: 4.0, y: 5.0)
//if p1.isToTheRightOf(x: 1.0) {
//    print("This point is to the right of the line where x == 1.0")
//}
//
//// 在实例方法中修改属性
//// 结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改
//// 可以选择在 func 关键字前放一个 mutating 关键字来指定方可以修改属性
//struct Point2 {
//    var x = 0.0
//    var y = 0.0
//
//    mutating func moveBy(x: Double, y: Double) {
//        self.x += x
//        self.y += y
//    }
//
//    // 实例方法
//    func printInfo() {
//        print("x is \(x), y is \(y)")
//    }
//}
//var p2 = Point2(x: 2.0, y: 2.0)
//p2.moveBy(x: 2.0, y: 5.0)
//p2.printInfo()
//
//// 枚举的 mutating 方法
//enum TriStateSwitch {
//    case off, low, high
//    mutating func next() {
//        switch self {
//        case .off:
//            self = .low
//        case .low:
//            self = .high
//        case .high:
//            self = .off
//        }
//    }
//}
//var ovenLight = TriStateSwitch.low
//ovenLight.next()
//ovenLight.next()


//// MARK: - 下标
//// 下标语法
//struct TimesTable {
//    let multiplier: Int
//    subscript(index: Int) -> Int {
//        return multiplier * index
//    }
//}
//let threeTimesTable = TimesTable(multiplier: 3)
//print("six times three is \(threeTimesTable[6])")
//
//// 下标参数
//struct Matrix {
//    let rows: Int, columns: Int
//    var grid: [Double]
//    init(rows: Int, columns: Int) {
//        self.rows = rows
//        self.columns = columns
//        grid = Array(repeating: 0.0, count: rows * columns)
//    }
//    subscript(row: Int, column: Int) -> Double {
//        get {
//            assert(indexIsValid(row: row, column: column), "Index out of range")
//            return grid[(row * columns) + column]
//        }
//        set {
//            assert(indexIsValid(row: row, column: column), "Index out of range")
//            grid[(row * columns) + column] = newValue
//        }
//    }
//    func indexIsValid(row: Int, column: Int) -> Bool {
//        return row >= 0 && row < rows && column >= 0 && column < columns
//    }
//}
//
//var matrix = Matrix(rows: 2, columns: 2)
//matrix[1, 0] = 9.9
//matrix[0, 1] = 8.8
//print(matrix.grid)
//print(matrix[0, 1])
//
//// 类型下标
//enum CompassPoint: Int {
//    case sourth = 1
//    case north
//    case east
//    case west
//    
//    static subscript(index: Int) -> CompassPoint {
//        get {
//            return CompassPoint(rawValue: index)!
//        }
//    }
//}
//
//let direction = CompassPoint[2]
//print(direction)
