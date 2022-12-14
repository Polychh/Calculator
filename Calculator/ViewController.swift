//
//  ViewController.swift
//  Calculator
//
//  Created by USER on 26.09.2022.
//

import UIKit

class ViewController: UIViewController {
    var numberFromScreen: Double = 0
    var firstNum: Double = 0
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
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)! // отслеживаем какое предыдущие число было до нажатия на мат знак
            
            if sender.tag == 11 {
                result.text = "/"
            }
            else if sender.tag == 12 {
                result.text = "x"
            }
            else if sender.tag == 13{
                result.text = "-"
            }
            else if sender.tag == 14{
                result.text = "+"
            }
            operation = sender.tag
            mathSign = true

        }
        else if sender.tag == 15{
            if operation == 11{
                result.text = String(firstNum / numberFromScreen)
            }
            else if operation == 12{
                result.text = String(firstNum * numberFromScreen)
                
            }
            else if operation == 13{
                result.text = String(firstNum - numberFromScreen)
            }
            else if operation == 14{
                result.text = String(firstNum + numberFromScreen)
            }
        }
        else if sender.tag == 10{
            result.text = ""
            firstNum = 0
            numberFromScreen = 0
            operation = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

