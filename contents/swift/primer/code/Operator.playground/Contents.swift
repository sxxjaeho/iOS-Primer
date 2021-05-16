import UIKit

var str = "Hello, playground"

////赋值运算符没有返回值
//var a = 1
//var b = 0
//if b == a {
//    print("相等")
//}
//
////取余前面的数分正负 后面的数不分正负 结果与前面的数符号相同
//let c = -9 % -4
//print(c)

//溢出运算 &+ &- &*
//let num1:UInt8 = 250
//let num2 = num1 &+ 10

//let num1:UInt8 = 0
//let num2 = num1 &- 1

//let num1:Int8 = -128
//let num2 = num1 &- 1

// ?? 合并空值运算符
//let a: Int? = nil
//let b = "abc"
//print(a ?? b)

//func addTwoNum (num1: Int?, num2:Int?) -> Int{
////    return num1! + num2!
//
////    if num1 != nil {
////        if num2 != nil {
////            return num1! + num2!
////        } else {
////            return num1!
////        }
////    } else {
////        if num2 != nil {
////            return num2!
////        } else {
////            return 0
////        }
////    }
//
////    return (num1 ?? 0) + (num2 ?? 0)
//}
//
//print(addTwoNum(num1: 2, num2: 3))

//区间
//闭区间
//let range = 0...10

//半包半闭
//let range = 0..<10
//for i in range{
//    print(i)
//}

//let names = ["zhangsan", "lisi", "wangwu", "zhaoliu"]
//for name in names[...2]{
//    print(name)
//}
//print("--------")
//for name in names[2...]{
//    print(name)
//}
//print("--------")
//for name in names[..<2]{
//    print(name)
//}

//var welcome = "Hello World"
//let range = welcome.startIndex...welcome.index(welcome.endIndex, offsetBy: -6)
//welcome.removeSubrange(range)
//print(welcome)

//let range = "a"..."z"
//for c in welcome{
//    if !range .contains(String(c)) {
////        print(String(c) + "不是小写")
//        print("\(c)不是小写")
//    }
//}

//for i in (0...10).reversed() {
//    print(i)
//}

//位运算符
//let number1: UInt8 = 255
////取反操作
//let number2 = ~number1
//print(number2)
//
////与操作 都是1 才是1
//let number3 = number1 & number2
//print(number3)
//
////或操作 有一个1 就是1
//let number4 = number1 | number2
//print(number4)
//
////异或操作 一个1 一个0 才返回1
//let number5 = number1 ^ number2
//print(number5)
//
//let number6: Int8 = -8
//print(number6 << 1)
//print(number6 >> 1)

//位运算符应用
//两个数字交换
//var a = 10
//var b = 8
//a = a ^ b
//b = a ^ b
//a = a ^ b
//print(a, b)

//求UInt 1的个数
//1.
//func getCountOfOne1(number:UInt) -> UInt{
//    var count:UInt = 0
//    var temp = number
//    while temp != 0 {
//        count += (temp & 1)
//        temp = (temp >> 1)
//    }
//    return count
//}
//print(getCountOfOne1(number: 243))

//2.
//func getCountOfOne2(number:UInt) -> UInt{
//    var count:UInt = 0
//    var temp = number
//    while temp != 0 {
//        count += 1
//        temp = temp & (temp - 1)
//    }
//    return count
//}
//print(getCountOfOne2(number: 243))


//判断一个数是2的整数次幂
//func isPowerOfTwo(num:UInt) -> Bool{
//    return (num & (num - 1)) == 0
//}
//print(isPowerOfTwo(num: 8))
//print(isPowerOfTwo(num: 7))

//一个数组中数字都是成对出现  现在丢了一个  寻找丢失的数字
//寻找丢失的数字
//func findLostNum(nums:[UInt]) -> UInt{
//    var lostNum:UInt = 0
//    for num in nums {
//        lostNum = lostNum ^ num
//    }
//    return lostNum
//}
//print(findLostNum(nums: [1,2,3,4,3,2,1]))

//寻找丢失的两个数
//func findTwoNum(nums:[UInt]) -> (UInt, UInt){
//    var lostNum1:UInt = 0
//    var lostNum2:UInt = 0
//
//    //找两个数异或的结果
//    var temp:UInt = 0
//    for num in nums {
//        temp = temp ^ num
//        print("temp = \(temp)") // temp = 2
//    }
//
//    //找到第一个为1的位
//    var flag:UInt = 1
//    while ((flag & temp) == 0) {
//        flag = flag << 1
//    }
//    
//    // 001
//    // 010
//    
//    // 010
//    // 010
//    print("flag = \(flag)") // flag = 2
//    
//    var lostNum1Array: Array<Int> = []
//    var lostNum2Array: Array<Int> = []
//    //分组计算
//    for num in nums {
//        
//        if (num & flag) == 0 {
//            
//            lostNum1 = lostNum1 ^ num
//            lostNum1Array.append(Int(num))
//        }
//        else{
//            lostNum2 = lostNum2 ^ num
//            lostNum2Array.append(Int(num))
//        }
//    }
//    print(lostNum1Array) // [1]
//    print(lostNum2Array) // [2, 3, 2]
//    return (lostNum1, lostNum2)
//}
//print(findTwoNum(nums: [1,2,3,2]))

//定义结构体
//struct Vector2D {
//    var x = 0.0, y = 0.0
//}

//extension Vector2D {
//    static func + (left: Vector2D, right:Vector2D) -> Vector2D {
//        return Vector2D(x: left.x + right.x, y:left.y + right.y)
//    }
//}
//
//let vector = Vector2D(x:1, y:3)
//let anotherVector = Vector2D(x:2, y:4)
//let andVector = vector + anotherVector
//print(andVector)

//prefix 1元运算符指定前缀
//extension Vector2D{
//    static prefix func - (vector:Vector2D) -> Vector2D{
//        return Vector2D(x: -vector.x, y: -vector.y)
//    }
//}
//print(-Vector2D(x:3,y:2))


//extension Vector2D{
//    static func += (left:inout Vector2D, right:Vector2D){
//        left = Vector2D(x: left.x + right.x, y: left.y + right.y)
//    }
//}
//var vector3 = Vector2D(x:3, y:4)
//var vector4 = Vector2D(x:3, y:4)
//vector3 += vector4
//print(vector3)


//var vector5 = Vector2D(x:3, y:4)
//var vector6 = Vector2D(x:3, y:4)
//extension Vector2D: Equatable {
//    static func == (left: Vector2D, right: Vector2D) -> Bool{
//        return (left.x == right.x) && (left.y == right.y)
//    }
//}
//print(vector5 == vector6)

//prefix operator +++
////prefix指定前缀还是后缀
//extension Vector2D {
//    static prefix func +++ (vector: Vector2D) -> Vector2D{
//        return Vector2D(x: vector.x + vector.x, y: vector.y + vector.y)
//    }
//}
//
//var vectornum = Vector2D(x: 2, y: 3)
//var doubleVector = +++vectornum
//print(doubleVector)

//自定义中缀运算符
//infix指定中缀运算符
//infix operator +-:AdditionPrecedence
//extension Vector2D{
//    static func +- (left:Vector2D, right:Vector2D) -> Vector2D{
//        return Vector2D(x: left.x + right.x, y: left.y - right.y)
//    }
//}
//var firstVector = Vector2D(x: 7, y: 7)
//var secondVector = Vector2D(x: 1, y: 3)
//var thirdVector = Vector2D(x: 2, y: 5)
////var sum = firstVector +- secondVector;
////print(sum)
//
//infix operator *^:MyPrecedence
//
////定义一个自己的优先级
//precedencegroup MyPrecedence {
//    //结合性
//    associativity:left
//    //优先级
//    lowerThan:AdditionPrecedence
//}
//
//extension Vector2D{
//    static func *^ (left:Vector2D, right:Vector2D) -> Vector2D{
//        return Vector2D(x: left.x * right.x, y: left.y * left.y + right.y * right.y)
//    }
//}
//var sum2 = firstVector *^ secondVector
////print(sum2)
//
//
//var sum3 = firstVector +- secondVector *^ thirdVector
//print(sum3)
