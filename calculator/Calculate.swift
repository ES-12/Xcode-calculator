//
//  ViewController.swift
//  calculator
//
//  Created by user on 08.11.2022.
//

import UIKit

class Calculate: UIViewController {
    
    //display data output
    @IBOutlet weak var outlineLabel: UILabel!
    @IBOutlet weak var outlineLabelNumber1: UILabel!
    @IBOutlet weak var outlineLabelNumber2: UILabel!
    @IBOutlet weak var outlineLabelOperand: UILabel!
    
    //data storage
    var firstNumber: String = ""
    var secondNumber: String = ""
    var operand: String = ""
    
    //getting data from 1-9 buttons
    @IBAction func digitalTapped(_ sender: UIButton) {
        addNumber(number: (sender.titleLabel?.text)!)
    }
    
    //input of numbers
    func addNumber (number: String) {
        if operand.isEmpty {
            firstNumber += number
            outlineLabel.text = firstNumber
            outlineLabelNumber1.text = firstNumber
        } else  {
            if !firstNumber.isEmpty {
                secondNumber += number
                outlineLabel.text = secondNumber
                outlineLabelNumber2.text = secondNumber
            } else {
                return outlineLabel.text = "enter 1st number"
            }
        }
    }
    
    //input of operand
    @IBAction func operandAction(_ sender: UIButton) {
        if !firstNumber.isEmpty {
            operand = (sender.titleLabel?.text)!
            outlineLabel.text = operand
            outlineLabelOperand.text = operand
        } else { return outlineLabel.text = "enter 1st number"}
    }
    
    // data cleaning
    @IBAction func clearCalculateAction(_ sender: UIButton) {
        firstNumber = ""
        secondNumber = ""
        operand = ""
        outlineLabel.text = ""
        outlineLabelNumber1.text = ""
        outlineLabelNumber2.text = ""
        outlineLabelOperand.text = ""
    }
    
    //calculation and output of result
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
                    outlineLabelNumber1.text = ""
                    outlineLabelNumber2.text = ""
                    outlineLabelOperand.text = ""
                    return outlineLabel.text = "inf"
                } else {
                    result = Double(firstNumber)! / Double(secondNumber)!
                }
            default:
                break
        }
        showResult(number: result)
    }
    
    //converting the into string and copying the result
    //in data storage->firstNumber
    func showResult(number: Double) {
        if String(number) == "inf" {
            firstNumber = ""
            secondNumber = ""
            outlineLabelNumber1.text = ""
            outlineLabelNumber2.text = ""
            outlineLabelOperand.text = ""
            return outlineLabel.text = "inf"
        } else if number.truncatingRemainder(dividingBy: 1.0) == 0.0 {
            outlineLabel.text = String(Int(number))
            firstNumber = outlineLabel.text!
            outlineLabelNumber1.text = firstNumber
            outlineLabelNumber2.text = ""
            outlineLabelOperand.text = ""
            secondNumber = ""
        } else {
            outlineLabel.text = String(number)
            firstNumber = outlineLabel.text!
            outlineLabelNumber1.text = firstNumber
            outlineLabelNumber2.text = ""
            outlineLabelOperand.text = ""
            secondNumber = ""
        }
    }
}
