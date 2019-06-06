//
//  BlockMatrix.swift
//  SwiftUI2048
//
//  Created by Hongyu on 6/5/19.
//  Copyright © 2019 Cyandev. All rights reserved.
//

import Foundation

protocol Block {
    
    associatedtype Value
    
    var number: Value { get set }
    
}

struct IndexedBlock<T> {
    
    let index: (Int, Int)
    let item: T?

}

struct BlockMatrix<T> : CustomDebugStringConvertible where T: Block {
    
    typealias Index = (Int, Int)
    
    fileprivate var matrix: [[T?]]
    
    init() {
        matrix = [[T?]]()
        for _ in 0..<4 {
            var row = [T?]()
            for _ in 0..<4 {
                row.append(nil)
            }
            matrix.append(row)
        }
    }
    
    var debugDescription: String {
        matrix.map { row -> String in
            row.map {
                if $0 == nil {
                    return " "
                } else {
                    return String(describing: $0!.number)
                }
            }.joined(separator: "\t")
        }.joined(separator: "\n")
    }
    
    var flatten: [IndexedBlock<T>] {
        return self.matrix.enumerated().flatMap { (y: Int, element: [T?]) in
            element.enumerated().map { (x: Int, element: T?) in
                return IndexedBlock(index: (x, y), item: element)
            }
        }
    }
    
    subscript(index: Self.Index) -> T? {
        guard isIndexValid(index) else {
            return nil
        }
        
        return matrix[index.1][index.0]
    }
    
    /// Move the block to specific location and leave the original location blank.
    /// - Parameter from: Source location
    /// - Parameter to: Destination location
    mutating func move(from: Self.Index, to: Self.Index) {
        guard isIndexValid(from) && isIndexValid(to) else {
            // TODO: Throw an error?
            return
        }
        
        guard let source = self[from] else {
            return
        }
        
        matrix[to.1][to.0] = source
        matrix[from.1][from.0] = nil
    }
    
    /// Move the block to specific location, change its value and leave the original location blank.
    /// - Parameter from: Source location
    /// - Parameter to: Destination location
    /// - Parameter newValue: The new value
    mutating func move(from: Self.Index, to: Self.Index, with newValue: T.Value) {
        guard isIndexValid(from) && isIndexValid(to) else {
            // TODO: Throw an error?
            return
        }
        
        guard var source = self[from] else {
            return
        }
        
        source.number = newValue
        
        matrix[to.1][to.0] = source
        matrix[from.1][from.0] = nil
    }
    
    /// Place a block to specific location.
    /// - Parameter block: The block to place
    /// - Parameter to: Destination location
    mutating func place(_ block: T?, to: Self.Index) {
        matrix[to.1][to.0] = block
    }
    
    fileprivate func isIndexValid(_ index: Self.Index) -> Bool {
        guard index.0 >= 0 && index.0 < 4 else {
            return false
        }
        
        guard index.1 >= 0 && index.1 < 4 else {
            return false
        }
        
        return true
    }
    
}
