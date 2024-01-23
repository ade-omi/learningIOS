//
//  ViewController.swift
//  Calculator
//
//  Created by Default User on 1/17/24.
//

import UIKit

class ViewController: UIViewController {

    //adding variables
    let PLUS = 10
    let MINUS = 11
    let MULTIPLY = 12
    let DIVIDE = 13
    
    var num1: NSInteger = 0
    var num2 : NSInteger = 0
    var answer : Double = 0.0
    var operand : NSInteger = 0
    
    var theNumber : String = "0"
    @IBOutlet var lblText : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theNumber = "0"
        
        lblText.text = theNumber
        
        printNumber()
        
    }
    //print the number
    func printNumber(){
        lblText.text = theNumber
    }
    //function for connecting buttons to ui EVENT HANDLER
    @IBAction func pressNum(sender : UIButton){
        
        if(sender.tag >= 0 && sender.tag <= 9){
            theNumber += String(sender.tag)
            printNumber()
        }
    }
    
    //save values
    func saveNum1(){
        num1 = Int(theNumber)!
        theNumber = "0"
        printNumber()
    }
    
    //Event handler for operationz
    @IBAction func setOperand(sender : UIButton){
        if(sender.tag >= PLUS && sender.tag <= DIVIDE){
            saveNum1()
            operand = sender.tag
        }
    }
    
    @IBAction func clearNum(sender : UIButton){
        theNumber = "0"
        printNumber()
        
    }
    
    @IBAction func calculate(sender : UIButton){
        num2 = Int(theNumber)!
        
        if(operand == PLUS){
            answer = Double(num1 + num2)
        }
        if (operand == MINUS){
            answer = Double(num1 - num2)
        }
        
        if (operand == MULTIPLY){
            answer = Double(num1 * num2)
            
        }
        if (operand == DIVIDE){
            if(num2 == 0){
                //alert pop up
                let alert = UIAlertController(title: "Error", message: "Cannot Divide by 0", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
                alert.addAction(cancelAction)
                
                present(alert, animated: true)
            }else{
                answer = Double(num1) / Double(num2)
                
            }
        }
        finishAnswer()
    }
    func finishAnswer(){
        theNumber = String(answer)
        printNumber()
        
        num1 = 0
        num2 = 0
        answer = 0.0
        operand = 0
    }
    
}

