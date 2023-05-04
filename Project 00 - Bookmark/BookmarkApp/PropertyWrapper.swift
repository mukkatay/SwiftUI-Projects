//
//  PropertyWrapper.swift
//  BookmarkApp
//
//  Created by Akyl Mukatay  on 19.04.2023.
//

import SwiftUI

typealias Codable = Decodable & Encodable

struct User: Codable {
    var name: String
    var age: Int
    var surname: String
}

struct AppDataAPI {
    @AppDataStorage(key: "isWelcomeSeen", defaultValue: false)
    static var isWelcome: Bool

}

@propertyWrapper
struct AppDataStorage<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            guard let data = try? UserDefaults.standard.object(forKey: key) as? Data else {
                return defaultValue
            }
            let value = try? JSONDecoder().decode(T.self, from: data)
            return value ?? defaultValue
        }

        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

