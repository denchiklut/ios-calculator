//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
   
    private var isFinishedTyping:Bool = true
    private var calculatorLogic = CalculatorLogic()
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot covert display label text to a Double")
            }
            
            return number
        }
        set {
            if floor(newValue) == newValue {
                displayLabel.text = String(format: "%.0f", newValue)
            } else {
                displayLabel.text = String(newValue)
            }
        }
    }
     
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        if let method = sender.currentTitle {
            calculatorLogic.setNumber(displayValue)
            
            if let result = calculatorLogic.calculate(symbol: method) {
                displayValue = result
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                if numValue  == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

