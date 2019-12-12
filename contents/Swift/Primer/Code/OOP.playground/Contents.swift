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


//// MARK: - 类的初始化和反初始化
//// 初始化器
//struct Fahrenheit {
//    var temperature: Double
//    init() {
//        temperature = 32.0
//    }
//}
//var f = Fahrenheit()
//print("The default temperature is \(f.temperature)° Fahrenheit")
//
//// 默认的属性值
//struct Fahrenheit1 {
//    var temperature = 32.0
//}
//var f1 = Fahrenheit1()
//print("The default temperature is \(f.temperature)° Fahrenheit")
//
//// 默认的初始化器
//class ShoppingListItem {
//    var name: String?
//    var quantity = 1
//    var purchased = false
//}
//var item = ShoppingListItem()
//
//// 自定义初始化
//struct Celsius {
//    var temperatureInCelsius: Double
//    init(fromFahrenheit fahrenheit: Double) {
//        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
//    }
//    init(fromKelvin kelvin: Double) {
//        temperatureInCelsius = kelvin - 273.15
//    }
//}
//let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
//let freezingPointOfWater = Celsius(fromKelvin: 273.15)
//
//// 在初始化中分配常量属性
//class SurveyQuestion {
//    let text: String
//    var response: String?
//    init(text: String) {
//        self.text = text
//    }
//    func ask() {
//        print(text)
//    }
//}
//let beetsQuestion = SurveyQuestion(text: "How about beets?")
//beetsQuestion.ask()
//beetsQuestion.response = "I also like beets. (But not with cheese.)"
//
//// 结构体的成员初始化器
//struct Size {
//    var width = 0.0, height = 0.0
//}
//let twoByTwo = Size(width: 2.0, height: 2.0)
//
//// 值类型的初始化器委托
//struct Point {
//    var x = 0.0, y = 0.0
//}
//
//struct Rect {
//    var origin = Point()
//    var size = Size()
//    init() {}
//    init(origin: Point, size: Size) {
//        self.origin = origin
//        self.size = size
//    }
//    init(center: Point, size:Size) {
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.width / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size)
//    }
//}
//
//// 类的继承和初始化
//// 指定初始化器和便捷初始化器
//
//// 类的初始化委托
//
//// 两段式初始化
//// 安全检查
//class Person {
//    var name: String
//    var age: Int
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//    convenience init(age: Int) {
//        self.init(name: "[Unnamed]", age: age)
//    }
//}
//
//class Teacher: Person {
//    var salary: Int
//    init(name: String, age: Int, salary: Int) {
////        super.init(name: name, age: age)
////        self.salary = salary // 1.指定初始化器必须保证在向上委托给父类初始化器之前，其所在类引入的所有属性都要初始化完成
////        self.name = name + "老师"
//
//
////        self.salary = salary
////        self.name = name + "老师" // 2.指定初始化器必须先向上委托父类初始化器，然后才能为继承的属性设置新值
////        super.init(name: name, age: age)
//
//        self.salary = salary
////        self.test() // 4.初始化器在第一阶段初始化完成之前，不能调用任何实例方法、不能读取任何实例属性的值，也 不能引用 self 作为值
//        super.init(name: name, age: age)
//        self.test()
//        self.name = name + "老师"
//    }
//    convenience init(name: String) {
////        self.name = name + "老师" // 3.便捷初始化器必须先委托同类中的其它初始化器，然后再为任意属性赋新值
////        self.init(name: name, age: 30, salary: 5000)
//
//        self.init(name: name, age: 30, salary: 5000)
//        self.name = name + "老师"
//    }
//    func test () {
//        print("i am a teacher")
//    }
//    func showInfo() {
//        print("teacher name \(name), age \(age), salary \(salary)")
//    }
//}
//
//// 初始化器的继承和重写
//class Teacher1: Person {
//    var salary: Int = 5000
//
////    override init(name: String, age: Int) {
////        self.salary = 5000
////        super.init(name: name, age: age)
////    }
//
//    func showInfo() {
//        print("teacher name \(name), age \(age), salary \(salary)")
//    }
//}
//
//let teacher = Teacher1(age: 20)
//teacher.showInfo()
//
//// 初始化器的自动继承
//// 如果你的子类没有定义任何指定初始化器，它会自动继承父类所有的指定初始化器
//// 重写父类的所有指定初始化器，它会自动继承父类所有的指定初始化器
//
//// 可失败初始化器
//// 通常来讲我们通过在 init 关键字后添加问号 (init?)的方式来定义一个可失败初始化器以创建 一个合适类型的可选项实例
//
//// 必要初始化器
//// 在类的初始化器前添加 required 修饰符来表明所有该类的子类都必须实现该初始化器
//
//// 反初始化器
//// 在类实例被释放的时候，反初始化器就会立即被调用，你可以是用 deinit 关键字来写反初始 化器，就如同写初始化器要用 init 关键字一样。反初始化器只在类类型中有效


//// MARK: - 继承
//// 定义基类
//class Vehicle {
//    var currentSpeed = 0.0
//    var description: String {
//        return "traveling at \(currentSpeed) miles per hour"
//    }
//    func makeNoise() {
//    }
//}
//
//// 子类
//class Bicycle: Vehicle {
//    var hasBasket = false
//}
//let bicycle = Bicycle()
//bicycle.hasBasket = true
//bicycle.currentSpeed = 15.0
//print("Bicycle: \(bicycle.description)")
//
//// 重写
//class Car: Vehicle {
//    var gear: Int = 0
//    // 重写方法
//    override var description : String {
//        return super.description + "at gear \(gear)"
//    }
//}
//var car = Car()
//car.gear = 3
//car.currentSpeed = 30
//print(car.description)
//
//// 阻止重写
//// 可以通过标记为 ﬁnal 来阻止一个方法、属性或者下标脚本被重写


//// MARK: - 多态和类型转换
//// 类型
//class MediaItem {
//    var name: String
//    init(name: String) {
//        self.name = name
//    }
//}
//
//class Movie: MediaItem {
//    var director: String
//    init(name: String, director: String) {
//        self.director = director
//        super.init(name: name)
//    }
//}
//
//class Song: MediaItem {
//    var artist: String
//    init(name: String, artist: String) {
//        self.artist = artist
//        super.init(name: name)
//    }
//}
//let array = [Movie(name: "1", director: "2"),
//             Song(name: "3", artist: "4"),
//             Movie(name: "5", director: "6")]
//print(type(of: array))
//
//for item in array {
//    // 向下类型转换
//    // 某个类类型的常量或变量可能实际上在后台引用自一个子类的实例。当你遇到这种情况时你 可以尝试使用类型转换操作符（ as? 或 as! ）将它向下类型转换至其子类类型
//    if let realItem = item as? Movie {
//        print(realItem.director)
//    }
//}
//
//// 类型检查
//// 使用类型检查操作符 （ is ）来检查一个实例是否属于一个特定的子类
//
//// Any 和 AnyObject
//// Swift 为不确定的类型提供了两种特殊的类型别名：
//// AnyObject 可以表示任何类类型的实例
//// Any 可以表示任何类型，包括函数类型
//
//// 嵌套类型
//// Swift 中的类，结构体和枚举可以进行嵌套，即在某一类型的内部定义类型，这种类型嵌套 在 Java 中称为内部类，在 C# 中称为嵌套类
//// 嵌套类型的能够访问它外部的成员


//// MARK: - 扩展
//// extension
//// 添加计算实例属性和计算类型属性
//extension Double {
//    var km: Double {
//        return self / 1000.0
//    }
//}
//let speed = 1200.0
//print(speed.km)
//
//// 定义实例方法和类型方法
//extension Int {
//    func repetition(task: () -> Void) {
//        for _ in 0..<self {
//            task()
//        }
//    }
//    // mutating 方法
//    mutating func square() -> Int {
//        self = self * self
//        return self
//    }
//}
//3.repetition {
//    print("hello")
//}
//
//var someInt = 3
//print(someInt.square())
//
//// 提供新初始化器
//struct Size {
//    var width = 0.0, height = 0.0
//}
//
//struct Point {
//    var x = 0.0, y = 0.0
//}
//
//struct Rect {
//    var origin = Point()
//    var size = Size()
//}
//
//extension Rect {
//    init(center: Point, size: Size) {
//        let originX = center.x - (size.width / 2)
//        let originY = center.y - (size.height / 2)
//        self.init(origin: Point(x: originX, y: originY), size: size)
//    }
//}
//
//let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
//print(centerRect)
//
//// 定义下标
//extension Int {
//    subscript(digitIndex: Int) -> Int {
//        get {
//            var decimalBase = 1
//            for _ in 0..<digitIndex {
//                decimalBase *= 10
//            }
//            return (self / decimalBase) % 10
//        }
//    }
//}
//print(73112402[0])
//print(73112402[1])
//print(73112402[2])
//
//// 定义和使用新内嵌类型
//extension Int {
//    enum Kind {
//        case negative, zero, positive
//    }
//    var kind: Kind {
//        switch self {
//        case 0:
//            return .zero
//        case let x where x > 0:
//            return .positive
//        default:
//            return .negative
//        }
//    }
//}
//print(9.kind)
//
//// 使现有的类型遵循某协议
//
//// 扩展可以向一个类型添加新的方法，但是不能重写已有的方法


