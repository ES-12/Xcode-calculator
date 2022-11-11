//
//  ViewController.swift
//  calculator
//
//  Created by user on 08.11.2022.
//

import UIKit

class Calculate: UIViewController {
    
    @IBOutlet weak var outlineLabel: UILabel!
    
    var firstNumber: String = ""
    var secondNumber: String = ""
    var operand: String = ""
    
    @IBAction func digitalTapped(_ sender: UIButton) {
        addNumber(number: (sender.titleLabel?.text)!)
    }
    
    func addNumber (number: String) {
        if operand.isEmpty {
            firstNumber += number
            outlineLabel.text = firstNumber
        } else  {
            secondNumber += number
            outlineLabel.text = secondNumber
        }
    }
    
    @IBAction func operandAction(_ sender: UIButton) {
        if !firstNumber.isEmpty {
            operand = (sender.titleLabel?.text)!
            outlineLabel.text = operand
        } else { return outlineLabel.text = "enter 1st number"}
    }
    
    @IBAction func clearCalculateAction(_ sender: UIButton) {
        firstNumber = ""
        secondNumber = ""
        operand = ""
        outlineLabel.text = "cleaned"
    }
    
    @IBAction func resultAction(_ sender: UIButton) {
        var result: Double = 0.0
        switch operand {
            case "+":
                result = Double(firstNumber)! + Double(secondNumber)!
            case "-":
                result = Double(firstNumber)! - Double(secondNumber)!
            case "*":
                result = Double(firstNumber)! * Double(secondNumber)!
            case "/":
                if secondNumber == "0" {
                    firstNumber = ""
                    secondNumber = ""
                    return outlineLabel.text = "infinity"
                } else {
                    result = Double(firstNumber)! / Double(secondNumber)!
                }
            default:
                break
        }
        showResult(number: result)
    }
    
    func showResult(number: Double) {
        if number.truncatingRemainder(dividingBy: 1.0) == 0.0 {
            outlineLabel.text = String(Int(number))
            firstNumber = outlineLabel.text!
            secondNumber = ""
        } else {
            outlineLabel.text = String(number)
            firstNumber = outlineLabel.text!
            secondNumber = ""
        }
    }
}
