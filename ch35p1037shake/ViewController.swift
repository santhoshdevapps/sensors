

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // shake device (or simulator), watch console for response
    // note that this does not disable Undo by shaking in text field
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var randomNumber: UILabel!
    //    @IBOutlet weak var imageView: UIImageView!
//
//    let images = ["1", "2", "3"]
//    var currentImage = 0
    
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
            let firstValue = Int(textField.text!)
            let radVal = Int(arc4random()%10)
            randomNumber.text =  String(radVal)
            if firstValue == radVal {
                
                print("hey, you won buddy!")
                let alert = UIAlertController(title: "You Won", message: "Congrats!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(alert, animated: true)
                display.text = "You Win."
            }else {
                display.text = "You Loser. Try Again!!!"
            }
            

        }
    }
    
}
