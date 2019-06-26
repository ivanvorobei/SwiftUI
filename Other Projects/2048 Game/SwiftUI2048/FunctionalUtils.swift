//
//  FunctionalUtils.swift
//  SwiftUI2048
//
//  Created by Hongyu on 6/5/19.
//  Copyright © 2019 Cyandev. All rights reserved.
//

import Foundation

func bind<T, U>(_ x: T, _ closure: (T) -> U) -> U {
    return closure(x)
}
