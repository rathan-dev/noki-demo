//
//  Localstorage.swift
//  noki-demo
//
//  Created by rathan on 23/07/24.
//

import SwiftUI

extension UserDefaults {
    func save<T: Codable>(_ value: T, forKey key: String) {
        if let encoded = try? JSONEncoder().encode(value) {
            self.set(encoded, forKey: key)
        }
    }
    
    func load<T: Codable>(forKey key: String) -> T? {
        if let savedData = self.data(forKey: key) {
            if let decoded = try? JSONDecoder().decode(T.self, from: savedData) {
                return decoded
            }
        }
        return nil
    }
}

