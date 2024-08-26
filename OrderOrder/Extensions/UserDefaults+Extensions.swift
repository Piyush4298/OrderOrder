//
//  UserDefaults+Extensions.swift
//  OrderOrder
//
//  Created by Piyush Pandey on 24/08/24.
//

import Foundation

extension UserDefaults {
    private enum UserDefaultKeys: String {
        case hasOnBoarded
    }
    
    var hasOnBoarded: Bool {
        get {
            bool(forKey: UserDefaultKeys.hasOnBoarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultKeys.hasOnBoarded.rawValue)
        }
    }
}
