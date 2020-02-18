//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Александров Денис Александрович on 17.02.2020.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    
    private var intermidiateCalc: (method: String, n1: Double)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    private func performResult(n2: Double) -> Double? {
        if let n1 = intermidiateCalc?.n1, let operation = intermidiateCalc?.method {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("Can`t recognize the operation")
            }
        }
        return nil
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "%":
                return n / 100
            case "AC":
                return 0
            case "=":
                return performResult(n2: n)
            default:
                intermidiateCalc = (method: symbol, n1: n)
            }
        }
        return nil
    }
}
