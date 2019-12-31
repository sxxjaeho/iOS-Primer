//
//  PropertyWrapperView.swift
//  Landmarks
//
//  Created by jaeho on 2019/12/17.
//  Copyright © 2019 Northeast Electric Power University. All rights reserved.
//

import SwiftUI

//extension UserDefaults {
//    public enum Keys {
//        static let hadShownUserGuide = "hadShownUserGuide"
//    }
//
//    var hadShownUserGuide: Bool {
//        set {
//            set(newValue, forKey: Keys.hadShownUserGuide)
//        }
//        get {
//            bool(forKey: Keys.hadShownUserGuide)
//        }
//    }
//}
//
//struct PropertyWrapperView: View {
//    @State private var showText = UserDefaults.standard.hadShownUserGuide ? "已展示过" : "未展示过"
//
//    var body: some View {
//
//        Button(action: {
//            if (!UserDefaults.standard.hadShownUserGuide) {
//                UserDefaults.standard.hadShownUserGuide = true
//                self.showText = "已经展过"
//            }
//        }) {
//            Text(self.showText)
//        }
//    }
//}

// 属性装饰器
@propertyWrapper
struct UserDefaultWrapper<T> {

    var key: String
    var defaultValue: T
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }

        get {
            return UserDefaults.standard.value(forKey: key) as? T ?? defaultValue
        }

    }

}

struct PropertyWrapperView: View {

    @UserDefaultWrapper("hadShownUserGuide", defaultValue: false)
    static var hadShownUserGuide: Bool

    @State private var showText = PropertyWrapperView.hadShownUserGuide ? "已展示过" : "未展示过"
    var body: some View {
        Button(action: {
            if (!PropertyWrapperView.hadShownUserGuide) {
                PropertyWrapperView.hadShownUserGuide = true
                self.showText = "已经展过"
            }
        }) {
            Text(self.showText)
        }
    }
}

struct PropertyWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrapperView()
    }
}
