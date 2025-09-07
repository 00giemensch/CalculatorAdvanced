//
//  ViewController.swift
//  Calculator
//
//  Created by Ilnur on 03.09.2025.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
             displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            if calcMethod == "+/-" {
//                displayLabel.text = String(displayValue * -1)
                displayValue = displayValue * -1
            } else if calcMethod == "AC" {
//                displayLabel.text = "0"
                displayValue = 0
            } else if calcMethod == "%" {
//                displayLabel.text = String(displayValue * 0.01)
                displayValue = (displayValue * 0.01)
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
    
        if let numValues = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValues
                isFinishedTypingNumber = false
            } else {
                
                if numValues == "." {
                    
                    guard let currentDisplayValue = Double(displayLabel.text!) else {
                        fatalError("Cannot convert display label text to a Double")
                    }
                    
                    let isInt = floor(currentDisplayValue) == currentDisplayValue
                    
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValues
            }
            
        }
    }

}

