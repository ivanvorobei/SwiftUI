//
//  Reducer.swift
//  SwiftUIDemo
//
//  Created by Thomas Ricouard on 05/06/2019.
//  Copyright © 2019 Thomas Ricouarf. All rights reserved.
//

import Foundation

protocol Reducer {
    associatedtype StateType: FluxState
    func reduce(state: StateType, action: Action) -> StateType
}
