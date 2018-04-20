/*
 * File Name : ViewController.swift
 * Name : Santhosh Damodharan
 * Date : 2017-04-19
 * StudentID : 300964037
 * Description : Simple Guess game which performs using shake sensor
 * Version : 1.1
 */

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // shake device (or simulator), watch console for response
    // note that this does not disable Undo by shaking in text field
    
    // OUTLETS ++++++++++++++++++++++++++++++
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var randomNumber: UILabel!

    // ACTIONS AND METHODS
    override var canBecomeFirstResponder : Bool {
        return true
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.becomeFirstResponder()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake
        {
            // VARIABLES +++++++++++++++++++++++++++
            let firstValue = Int(textField.text!)
            let radVal = Int(arc4random()%10)
            
            randomNumber.text =  String(radVal)
            
            if firstValue == radVal {
                // implemented when user wins
                print("hey, you won buddy!")
                let alert = UIAlertController(title: "You Won", message: "Congrats!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
                display.text = "You Won."
            }else {
                // implemented when user lose
                display.text = "You Loser. Try Again!!!"
            }
            

        }
    }
    
}
