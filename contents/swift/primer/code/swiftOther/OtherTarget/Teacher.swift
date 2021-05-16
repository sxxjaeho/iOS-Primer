//
//  Teacher.swift
//  OtherTarget
//
//  Created by jaeho on 2019/12/19.
//  Copyright © 2019 Northeast Electric Power University. All rights reserved.
//

import Foundation

class Teacher: Human {
    var salary: Int
    
    override init(name: String, age: Int) {
        self.salary = 5000
        super.init(name: name, age: age)
    }
    
}
