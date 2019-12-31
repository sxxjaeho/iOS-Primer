//
//  Human.swift
//  OtherTarget
//
//  Created by jaeho on 2019/12/19.
//  Copyright © 2019 Northeast Electric Power University. All rights reserved.
//

import Foundation

//open: 公开权限, 最高的权限, 可以被其他模块访问, 继承及复写。只能用于类和类的成员。
//
//
//public: 公有访问权限，类或者类的公有属性或者公有方法可以从文件或者模块的任何地方进行访问。那么什么样 才能成为一个模块呢？一个App就是一个模块，一个第三方API, 第三等方框架等都是一个完整的模块，这些模块如 果要对外留有访问的属性或者方法，就应该使用 public 的访问权限。public 的权限在 Swift 3.0 后无法在其他模 块被复写方法/属性或被继承。
//
//
//internal: 顾名思义，internal 是内部的意思，即有着 internal 访问权限的属性和方法说明在模块内部可以访问， 超出模块内部就不可被访问了。在 Swift 中默认就是 internal 的访问权限。
//
//
//ﬁleprivate: 文件私有访问权限，被 ﬁleprivate 修饰的类或者类的属性或方法可以在同一个物理文件中访问。如果 超出该物理文件，那么有着 ﬁleprivate 访问权限的类, 属性和方法就不能被访问。
//
//
//private: 私有访问权限，被 private 修饰的类或者类的属性或方法可以在同一个物理文件中的同一个类型(包含 extension)访问。如果超出该物理文件或不属于同一类型，那么有着 private 访问权限的属性和方法就不能被访 问。


// 结构体不可以声明成 open,应该声明成 public
//open struct Item {
//    <#fields#>
//}

// Swift 中默认就是 internal 的访问权限
// open 与 public 的区别是 public 允许外界访问,但是不允许继承,而 open 允许外界访问,继承,覆写
//open class Human {
//    var name: String
//    var age: Int
//
//    public init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}

// ﬁleprivate 本文件可见,而超出原文件无法访问
fileprivate class Human {
    var name: String
    private var age: Int

    // 潜规则2:常量、变量、属性、下标脚本访问级别低于其所声明的类型级别，并且如果不是默认访问级别 （internal）要明确声明访问级别（例如一个常量是一个 private 类型的类类型，那么此常量必 须声明为 private 或 ﬁleprivate）。
//    var sex: HumanSex 改为  private var sex: HumanSex
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // private 只能在同一个物理文件中的同一个类型访问
    private class HumanSex {
        
    }
}

//fileprivate class Employee: Human.HumanSex {
//
//}

//// 潜规则1:如果一个类的访问级别是 ﬁleprivate 或 private 那么该类的所有成员都是 ﬁleprivate 或 private（此时成员无法修改访问级别），如果一个类的访问级别是 open、internal 或者 public 那么它的所有成员都是internal，类成员的访问级别不能高于类的访问级别(注意：嵌套 类型的访问级别也符合此条规则)
//fileprivate class Employee: Human {
//    var salary: Int
//
//    override init(name: String, age: Int) {
//        self.salary = 5000
//        super.init(name: name, age: age)
//    }
//}

extension Human {
    func showInfo() {
        // extension 可以访问 private 属性
        print("name is \(name), age is \(age)")
    }
}
