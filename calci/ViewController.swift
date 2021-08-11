//
//  ViewController.swift
//  calci
//
//  Created by Bubbly Boey on 28/04/21.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var inputTextFiled: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    var inputNumber1 : Double?
    var inputNumber2 : Double?
    
    enum Operation {
        case addition
        case substraction
        case multiplication
        case division
       }
    var operationChosen : Operation = Operation.addition
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func clearScreenAction(_ sender: UIButton) {
            inputNumber1 = 0
            inputNumber2 = 0
        inputTextFiled.text?.removeAll()
        outputLabel.text = "Answer"
    }
    @IBAction func pressAddButton(_ sender: UIButton){
        operationChosen = .addition
        storeInput(inputNumber: &inputNumber1)
        }
    @IBAction func pressSubstraction(_ sender: UIButton) {
        operationChosen = .substraction
        storeInput(inputNumber: &inputNumber1)
        }
    @IBAction func pressMultiplication(_ sender: UIButton) {
        operationChosen = .multiplication
        storeInput(inputNumber: &inputNumber1)
    }
   @IBAction func pressDivision(_ sender: UIButton) {
        operationChosen = .division
        storeInput(inputNumber: &inputNumber1)
       }
    @IBAction func calculateAnswerAction(_ sender: UIButton) {
        storeInput(inputNumber: &inputNumber2)
        guard let input1 = inputNumber1 else{
            print("invalid input number1")
            return
        }
        guard let input2 = inputNumber2 else{
            print("invalid input number2")
            return
        }
        var answer : Double = 0
        switch operationChosen {
        case .addition:
            answer = input1 + input2
        
        case .substraction:
            answer = input1 - input2
        case .multiplication:
            answer = input1 * input2
        case .division:
            answer = input1 / input2
        }
        outputLabel.text = String(answer)
    }
    
    
    
    func storeInput(inputNumber: inout Double?){
        guard let inputText = inputTextFiled.text else{
            print("invalid input text")
            return
        }
        inputNumber = Double(inputText)
        inputTextFiled.text?.removeAll()
        
    }
}

