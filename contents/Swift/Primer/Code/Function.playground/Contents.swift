import UIKit

var str = "Hello, playground"

//// MARK: - 函数的定义
//// 有参数有返回值类型函数
//func great(person: String) -> String {
//    return "Hello," + person + "!"
//}
//
//// 隐式返回的函数
//func great1(person: String) -> String {
//    "Hello," + person + "!"
//}
//
//print(great(person: "zhangsan"))
//
//// 多返回值的函数
//func minMax(array: [Int]) -> (min: Int, max: Int)? {
//    if array.isEmpty {
//        return nil
//    }
//    var currentMin = array[0]
//    var currentMax = array[0]
//    for value in array {
//        if value < currentMin {
//            currentMin = value
//        } else if value > currentMax {
//            currentMax = value
//        }
//    }
//    return (currentMin, currentMax)
//}
//if let minMaxValue = minMax(array: [1, 2, 3, 4, 5]) {
//    print("min is \(minMaxValue.min), max is \(minMaxValue.max)")
//}


//// MARK: - 函数实际参数标签和形式参数名
//func addTwoNumber(num1: Int, num2: Int) -> Int {
//    return num1 + num2
//}
//print(addTwoNumber(num1: 1, num2: 2))
//
//// 指定实际参数标签
//func addTwoNumber(first num1: Int, second num2: Int) -> Int {
//    return num1 + num2
//}
//print(addTwoNumber(first: 1, second: 2))
//
//// 省略实际参数标签
//func addTwoNumber(_ num1: Int, _ num2: Int) -> Int {
//    return num1 + num2
//}
//print(addTwoNumber(1, 2))
//
//// 默认形式参数值
//func addTwoNumber2(_ num1: Int, _ num2: Int = 10) -> Int {
//    return num1 + num2
//}
//print(addTwoNumber2(1))
//
//// 可变形式参数
//func addTwoNumbers(nums: Int...) -> Int {
//    var sum = 0
//    for num in nums {
//        sum += num
//    }
//    return sum
//}
//print(addTwoNumbers(nums: 1, 2, 3, 4, 5))
//
//// 输入输出形式参数
//var number = 10
//var anotherNumber = 8
//
//func swapValue(_ a: inout Int, _ b: inout Int) {
//    let temp = a
//    a = b
//    b = temp
//}
//swapValue(&number, &anotherNumber)
//print(number)
//print(anotherNumber)


//// MARK: - 函数类型和内嵌函数
//// 函数类型:每一个函数都有一个特定的函数类型,它由形式参数类型,返回类型组成
//// 使用函数类型
//let swapFunc: (inout Int, inout Int) -> () = swapValue(_:_:)
//swapFunc(&number, &anotherNumber)
//print(number)
//print(anotherNumber)
//
//// 函数类型作为形式参数类型
//func addTwoNumber(a: Int, b: Int) -> Int {
//    return a + b
//}
//
//func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
//    print(mathFunction(a, b))
//}
//printMathResult(addTwoNumber(a:b:), 3, 5)
//
//// 函数类型作为返回类型
//// 内嵌函数
//func chooseStepFunction(backward: Bool) -> (Int) -> Int {
//    func stepForward(step: Int) -> Int { return step + 1 }
//    func stepBackward(step: Int) -> Int { return step - 1 }
//    return backward ? stepBackward : stepForward
//}
//var currentValue = 3
//let stepFunction = chooseStepFunction(backward: currentValue > 0)
//while currentValue != 0 {
//    currentValue = stepFunction(currentValue)
//}
//print(currentValue)

