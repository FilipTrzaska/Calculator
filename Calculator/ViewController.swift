//
//  ViewController.swift
//  Calculator
//
//  Created by Filip Trzaska on 28.09.2017.
//  Copyright © 2017 Filip Trzaska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen : Double = 0
    var calculating = false
    var previousNumber : Double = 0
    var operation = 0
    
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if calculating == true {
            numberLabel.text = String(sender.tag)
            numberOnScreen = Double(numberLabel.text!)!
            calculating = false
        } else {
            numberLabel.text = numberLabel.text! + String(sender.tag)
            numberOnScreen = Double(numberLabel.text!)!
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func functionButtonsPressed(_ sender: UIButton) {
        if numberLabel.text != "" && sender.tag != 11 && sender.tag != 18{
            previousNumber = Double(numberLabel.text!)!
            
            if sender.tag == 12 { // adds
                numberLabel.text = "+"
            } else if sender.tag == 13 { // substracts
                numberLabel.text = "-"
            } else if sender.tag == 14 { // multiplies
                numberLabel.text = "x"
            } else if sender.tag == 15 { // divides
                numberLabel.text = "/"
            }
            operation = sender.tag
            calculating = true
        } else if sender.tag == 11 { // =
            if operation == 12 {
                numberLabel.text = String(previousNumber + numberOnScreen)
            } else if operation == 13 {
                numberLabel.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 {
                numberLabel.text = String(previousNumber * numberOnScreen)
            } else if operation == 15 {
                if numberLabel.text == "0" {
                    reset()
                } else {
                numberLabel.text = String(previousNumber / numberOnScreen)
                }
            }
        } else if sender.tag == 18 {
            reset()
    }
    
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }

    }
    func reset() {
        numberLabel.text = ""
        operation = 0
        previousNumber = 0
    }

}
