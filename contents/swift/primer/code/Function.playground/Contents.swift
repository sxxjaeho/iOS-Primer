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


//// MARK: - 闭包
//// 闭包表达式
////{ (parameters) -> (return type) in
////  statements
////}
//
//let names = ["zhangsan", "lisei", "wangwu", "zhaoliu"]
////func backward(_ s1: String, _ s2: String) -> Bool {
////    return s1 > s2
////}
////
////var reverseNames = names.sorted(by: backward)
//
//var reverseNames = names.sorted(by: {(s1: String, s2:String) -> (Bool) in
//    return s1 > s2
//})
//print(reverseNames)
//
//// 从语境中推断类型
//var reverseNames1 = names.sorted(by: {(s1, s2) in return s1 > s2 })
//print(reverseNames1)
//
//// 从单表达式闭包隐式返回
//var reverseNames2 = names.sorted(by: {(s1, s2) in s1 > s2 })
//print(reverseNames2)
//
//// 简写实际参数名
//var reverseNames3 = names.sorted(by: { $0 > $1 })
//print(reverseNames3)
//
//// 运算符函数
//var reverseNames4 = names.sorted(by: > )
//print(reverseNames4)
//
//// 尾随闭包
//// 如果你需要将一个很长的闭包表达式作为函数最后一个实际参数传递给函数，使用尾随闭包将增强函数的可读性。尾随闭包是一个被书写在函数形式参数的括号外面的闭包表达式
//var reverseNames5 = names.sorted{ $0 > $1 }
//print(reverseNames5)


//// MARK: - 捕获值
//// 捕获值
//func makeIncrementer(forIncrement amount: Int) -> () -> Int {
//    var runningTotal = 0
//    func incrementer() -> Int {
//        runningTotal += amount
//        return runningTotal
//    }
//    return incrementer
//}
//
//let incrementByTen = makeIncrementer(forIncrement: 10)
//print(incrementByTen)
//print(incrementByTen)
//print(incrementByTen)
//
//// 如果你建立了第二个 incrementer ,它将会有一个新的、独立的 runningTotal 变量的 引用。
//let incrementBySeven = makeIncrementer(forIncrement: 7)
//print(incrementBySeven)
//
//// 闭包是引用类型
//// 在 Swift 中，函数和闭包都是引用类型
//let anotherIncrementByTen = incrementByTen
//print(anotherIncrementByTen)


//// MARK: - 逃逸闭包和自动闭包
//// 延迟处理，闭包内部的代码直到你调用它的时候才会运行
//var names: Array<String>! = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
////let customerProvider = { names.remove(at: 0) }
////print(names.count)
////print(customerProvider())
////print(names.count)
//
//// 逃逸闭包:闭包作为一个实际参数传递给一个函数的时候，并且它会在函数返回之后调用
//var providers:[() -> String] = [] // 闭包数组,闭包可以逃逸的一种方法是被储存在定义于函数外的变量里
//func collectCustomerProviders(provider: @escaping () -> String) {
//    providers.append(provider)
//}
//if let firstCustomer = names.first {
//    collectCustomerProviders(provider: { firstCustomer })
//}
//for provider in providers {
//    print("Served \(provider())!")
//}
//
//// 自动闭包
//print("---------------------")
//func collectCustomerProviders1(provider: () -> String) {
//    print("Now serving \(provider())!")
//}
//collectCustomerProviders1(provider: { names.remove(at: 0)})
//print("count = \(names.count)")
//
//// 通过 @autoclosure 标志标记它的形式参数使用了自动闭包,现在你可以调用函数就像它接收了一个 String 实际参数而不是闭包,实际参数自动地转换为闭包，
//func collectCustomerProviders2(provider: @autoclosure () -> String) {
//    print("Now serving \(provider())!")
//}
//collectCustomerProviders2(provider: names.remove(at: 0))
//print("count = \(names.count)")
//
//// 自动+逃逸
//print("---------------------")
//var names1: Array<String>! = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//var providers1:[() -> String] = []
//func collectCustomerProviders3(provider: @autoclosure @escaping () -> String) {
//    providers1.append(provider)
//}
//collectCustomerProviders3(provider: names1.remove(at: 0))
//collectCustomerProviders3(provider: names1.remove(at: 0))
//print("count = \(names.count)")
//
//for provider in providers1 {
//    print("Served \(provider())!")
//}
//
//// 让闭包 @escaping 意味着你必须在闭包中显式地引用 self
//class SomeClass {
//    var x: String = "hello"
//    func doSomething() {
//        collectCustomerProviders3(provider: self.x)
//    }
//}


//// MARK: - 高阶函数
//// map:对于原始集合里的每一个元素，以一个变换后的元素替换之形成一个新的集合
//let numbers = [1, 2, 4, 5, 10]
//print(numbers.map { $0 * 10 })
//
//// filter:对于原始集合里的每一个元素，通过判定来将其丢弃或者放进新集合
//print(numbers.filter { $0 > 4 })
//
//// reduce:对于原始集合里的每一个元素，作用于当前累积的结果上
//print(numbers.reduce(100) { $0 + $1 })
//
//// flatMap:对于元素是集合的集合，可以得到单级的集合
//let arrayNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//print(arrayNumbers.flatMap{ $0.map{ $0 * 10 }})
//
//// compactMap:过滤空值
//let names:[String?] = ["zhangsan", "lisi", nil, "wangwu", nil, "zhaoliu"]
//print(names.count)
//
//print(names.compactMap { $0 })
//print(names.compactMap { $0?.count })


//// MARK: - 函数式编程1
//// 读入一个文本文件，确定所有单词的使用频率并从高到低排序，打印出所有单词及其 频率的排序列表
// 命令式解法
//let words = """
//There are moments in life when you miss someone so much that you just want to pick them from your dreams and hug them for real dream what you want to dream go where you want to go be what you want to be because you have only one life and one life and one chance to do all the things you want to do
//"""
//let NON_WORDS = ["a", "of", "and", "or", "the", "on"]
//
//func wordFreq(words: String) -> [String: Int] {
//    var wordDict: [String: Int] = [:]
//    let wordList = words.split(separator: " ")
//    for word in wordList {
//        let lowercaseWord = word.lowercased()
//        if !NON_WORDS.contains(lowercaseWord) {
//            if let count = wordDict[lowercaseWord] {
//                wordDict[lowercaseWord] = count + 1
//            } else {
//                wordDict[lowercaseWord] = 1
//            }
//        }
//    }
//    return wordDict
//}
//print(wordFreq(words: words))
//
// 函数式解法
//func wordFreq1(words: String) -> [String: Int] {
//    var wordDict: [String: Int] = [:]
//    let wordList = words.split(separator: " ")
//    wordList.map { $0.lowercased() }
//        .filter { !NON_WORDS.contains($0)} // ?? 合并空值运算符
//        .forEach { wordDict[$0] = (wordDict[$0] ?? 0) + 1}
//
//    return wordDict;
//}
//print(wordFreq1(words: words))
//
//// 找到一个字符串里面某个字符数组里面第一个出现的字符的位置。比如“Hello， World”，[“a”, “e”, “i”, “o”, “u”]，那 e 是在字符串第一个出现的字符，位置是 1， 返回 1
//let words = "Hello, world"
//let letters = ["a", "e", "i", "o", "u"]
//func findFirstAppearLetterIndex(words: String) -> Int {
//    let result = zip(0..., Array(words)).map { $0 }
//        .filter { letters.contains(String($0.1.lowercased())) }
//    print(result)
//    return result.first?.0 ?? -1
//}
//print(findFirstAppearLetterIndex(words: words))


//// MARK: - 函数式编程2
//// 假设我们有一个名字列表，其中一些条目由单个字符构成。现在的任务是，将除去单字符条 目之外的列表内容，放在一个逗号分隔的字符串里返回，且每个名字的首字母都要大写。
//// 命令式解法
//let employee = ["neal", "s", "stu", "j", "rich", "bob", "aiden", "j", "ethan", "liam", "mason", "noah", "lucas", "jacob", "jack"]
//func cleanNames(names: Array<String>) -> String {
//    var cleanedNames = ""
//    for name in names {
//        if name.count > 1 {
//            cleanedNames += name.capitalized + ","
//        }
//    }
//    cleanedNames.remove(at: cleanedNames.index(before: cleanedNames.endIndex))
//    return cleanedNames
//}
//print(cleanNames(names: employee))
//
//// 函数式解法
//func cleanNames1(names: Array<String>) -> String {
//    let cleanedNames = employee.filter { $0.count > 1 }
//        .map { $0.capitalized }
//    .joined(separator: ",")
//    return cleanedNames
//}
//print(cleanNames1(names: employee))
//
//// 聊聊 Swift 的劣势-并行
//extension Array where Element: Any {
//    func paralletMap<T>(_ transform: (Element) -> T) -> [T] {
//        let n = self.count
//        if n == 0 {
//            return []
//        }
//        var result = ContiguousArray<T>() // “邻接数组”类型是一个总将元素存储在一个相邻的内存区域的专用的数组
//        result.reserveCapacity(n)
//
//        DispatchQueue.concurrentPerform(iterations: n) { (i) in
//            result.append(transform(self[i]))
//        }
//        return Array<T>(result)
//    }
//}
//
//// 具有普遍意义的基本构造单元
//// 筛选(filter)
//// 映射(map)
//// 折叠/化约(foldLeft/reduce等)
