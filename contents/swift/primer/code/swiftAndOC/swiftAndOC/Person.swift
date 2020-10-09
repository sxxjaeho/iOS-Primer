//
//  Person.swift
//  swiftAndOC
//
//  Created by xuzaihu on 2020/10/9.
//

import Foundation

class Person: NSObject {
    @objc var name = String()
    @objc var age = Int()
    
    @objc init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
