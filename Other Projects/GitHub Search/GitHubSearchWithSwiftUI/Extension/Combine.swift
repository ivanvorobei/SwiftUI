//
//  Combine.swift
//  GitHubSearchWithSwiftUI
//
//  Created by marty-suzuki on 2019/06/05.
//  Copyright © 2019 jp.marty-suzuki. All rights reserved.
//

import Foundation

struct CombineExtension<Base> {
    let base: Base

    init(_ base: Base) {
        self.base = base
    }
}

protocol CombineCompatible {
    associatedtype CombineExtensionBase

    static var combine: CombineExtension<CombineExtensionBase>.Type { get set }
    var combine: CombineExtension<CombineExtensionBase> { get set }
}

extension CombineCompatible {

    static var combine: CombineExtension<Self>.Type {
        get {
            return CombineExtension<Self>.self
        }
        set {}
    }

    var combine: CombineExtension<Self> {
        get {
            return CombineExtension<Self>(self)
        }
        set {}
    }
}
