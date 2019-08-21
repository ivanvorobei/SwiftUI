//
//  UserData.swift
//  Currency-SwiftUI
//
//  Created by Alex Liu on 2019-06-20.
//  Copyright © 2018 Alex Liu <alexliubo@gmail.com> All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Combine
import SwiftUI
import Foundation

private let defaultCurrencies: [Currency] = [
    Currency(name: "US dollar", rate: 1.0, symbol: "US", code: "USD"),
    Currency(name: "Canadian dollar", rate: 1.0, symbol: "CA", code: "CAD")
]

@propertyWrapper
struct UserDefaultValue<Value: Codable> {
    
    let key: String
    let defaultValue: Value
    
    var wrappedValue: Value {
        get {
            let data = UserDefaults.standard.data(forKey: key)
            let value = data.flatMap { try? JSONDecoder().decode(Value.self, from: $0) }
            return value ?? defaultValue
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

final class UserData: ObservableObject {
    let objectWillChange = PassthroughSubject<UserData, Never>()
    
    @UserDefaultValue(key: "allCurrencies", defaultValue: defaultCurrencies)
    var allCurrencies: [Currency] {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    @UserDefaultValue(key: "baseCurrency", defaultValue: defaultCurrencies[0])
    var baseCurrency: Currency {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    @UserDefaultValue(key: "userCurrency", defaultValue: defaultCurrencies)
    var userCurrency: [Currency] {
        didSet {
            objectWillChange.send(self)
        }
    }
}

