//
//  ViewController.swift
//  Calculator
//
//  Created by USER on 26.09.2022.
//

import UIKit

class ViewController: UIViewController {
    var numberFromScreen: Double = 0
    var firstNum: Double = 0 // до того как нажали на мат знак
    var mathSign: Bool = false
    var operation: Int = 0
    
    
    @IBOutlet weak var result: UILabel!
    
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true{

            result.text = String(sender.tag) // вписываем просто значение с кнопки если уже нажат какой то знак
            mathSign = false
        }
        else{
            result.text = result.text! + String(sender.tag)
        }
        numberFromScreen = Double(result.text!)!
//        print("num1 = ",firstNum)
//        print("num2 = ",numberFromScreen)
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        switch sender.tag {
        case 10:
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        case 11:
            firstNum = Double(result.text!)!
            result.text = "/"
            operation = sender.tag
            mathSign = true
        case 12:
            firstNum = Double(result.text!)!
            result.text = "x"
            operation = sender.tag
            mathSign = true
//            print("num1 = ",firstNum)
//            print("num2 = ",numberFromScreen)
        case 13:
            firstNum = Double(result.text!)!
            result.text = "-"
            operation = sender.tag
            mathSign = true
        case 14:
            firstNum = Double(result.text!)!
            result.text = "+"
            operation = sender.tag
            mathSign = true
        case 16:
            result.text = result.text! + "."
        case 17:
            result.text = String(sqrt(Double(result.text!)!))
        case 18:
            result.text = "-" + result.text!
        case 19:
            if firstNum == 0 {
                result.text = String(Double(Double(result.text!)! / 100))
            }else {
            result.text = String(Double(firstNum * numberFromScreen / 100))
            }
        default:
            print("Done")
        }
        
        switch operation {
        case 11 where sender.tag == 15:
            result.text = String(firstNum / numberFromScreen)
        case 12 where sender.tag == 15:
//            print("num1 = ",firstNum)
//            print("num2 = ",numberFromScreen)
            result.text = String(firstNum * numberFromScreen)
        case 13 where sender.tag == 15:
            result.text = String(firstNum - numberFromScreen)
        case 14 where sender.tag == 15:
            result.text = String(firstNum + numberFromScreen)
        default:
            print("Break")
        }
    }
}

