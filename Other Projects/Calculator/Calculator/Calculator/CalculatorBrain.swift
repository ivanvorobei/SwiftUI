//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 马红奇 on 2019/6/6.
//  Copyright © 2019 NSHotchner. All rights reserved.
//  from class

import Foundation

struct CalculatorBrain {
  
  // optional on initialization = not set
  private var accumulator: Double?
  
  // private enum specifying operation types
  // with an associated value
  private enum Operation {
    case constant(Double)
    case unary((Double) -> Double)
    case binary((Double,Double) -> Double)
    case equals
  }
  
  // private extensible dictionary of operations with closures
  private var operations: Dictionary<String,Operation> = [
    "π" : Operation.constant(Double.pi),
    "e" : Operation.constant(M_E),
    "√" : Operation.unary(sqrt),
    "cos" : Operation.unary(cos),
    "±" : Operation.unary({ -$0 }),
    "×" : Operation.binary({ $0 * $1 }),
    "÷" : Operation.binary({ $0 / $1 }),
    "+" : Operation.binary({ $0 + $1 }),
    "−" : Operation.binary({ $0 - $1 }),
    "=" : Operation.equals,
    "%" : Operation.binary({$0.truncatingRemainder(dividingBy: $1)}),
    "AC" : Operation.constant(0)
  ]
  
  mutating func performOperation(_ symbol: String) {
    if let operation = operations[symbol] {
      switch operation {
      case .constant(let value):
        accumulator = value
      case .unary(let f):
        if accumulator != nil {
          accumulator = f(accumulator!)
        }
      case .binary(let f):
        if accumulator != nil {
          pendingBinaryOperation = PendingBinaryOperation(function: f, firstOperand: accumulator!)
          accumulator = nil
        }
      case .equals:
        performPendingBinaryOperation()
      }
    } else {
      print("wrong operation symbol")
    }
  }
  
  // Private mutating func for performing pending binary operations
  mutating func performPendingBinaryOperation() {
    if pendingBinaryOperation != nil && accumulator != nil {
      accumulator = pendingBinaryOperation!.perform(with: accumulator!)
      pendingBinaryOperation = nil
    }
  }
  
  // Private optional Pending Binary Operation
  private var pendingBinaryOperation: PendingBinaryOperation?
  
  // embedded private struct to support binary operations
  // with a constant function and pending first operand
  // doesn't need mutating since its just returning a value
  private struct PendingBinaryOperation {
    let function: (Double, Double) -> Double
    let firstOperand: Double
    
    func perform(with secondOperand: Double) -> Double {
      return function(firstOperand, secondOperand)
    }
  }
  
  // mark method as mutating in order to assign to property
  mutating func setOperand(_ operand: Double) {
    accumulator = operand
  }
  
  // return an optional since the accumulator can be not set
  var result: Double? {
    get {
      return accumulator
    }
  }
  
}
