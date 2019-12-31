import UIKit

var str = "Hello, playground"

func addTwoNum(num1:Int, num2:Int) -> Int{
    return num1 + num2
}

let num = addTwoNum(num1:100, num2:50)

print(num)

class Person{
    var name:String
    var age:Int
    init(name:String, age:Int){
        self.name = name
        self.age = age
    }
}

//扩展:将类对象以字符串形式展现
extension Person:CustomStringConvertible {
    var description: String{
        get{
            return "\(name) \(age)"
        }
    }
}

let zhangsan = Person(name: "张三", age: 17)
