//
//  Person.swift
//  swiftAndOC
//
//  Created by xuzaihu on 2020/10/9.
//

import Foundation

extension Teacher {
    func indexOfString(aString: String) -> Int? {
        let index = Int(__index(of: aString))
        if index == NSNotFound {
            return nil
        }
        return index
    }
}

class Person: NSObject {
    @objc var name = String()
    @objc var age = Int()
    
    @objc init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
