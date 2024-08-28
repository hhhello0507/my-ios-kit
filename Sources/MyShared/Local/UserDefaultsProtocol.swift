//
//  UserDefaultsProtocol.swift
//  
//
//  Created by hhhello0507 on 8/28/24.
//

import Foundation

public protocol UserDefaultsProtocol: RawRepresentable<Self.Key> {
    
    typealias Key = String

    var userDefaults: UserDefaults { get }
}

public extension UserDefaultsProtocol {
    var value: Any? {
        userDefaults.value(forKey: self.rawValue)
    }
    
    func set(_ value: Any?) {
        userDefaults.setValue(value, forKey: self.rawValue)
    }
}
