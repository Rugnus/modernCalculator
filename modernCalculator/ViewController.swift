//
//  ViewController.swift
//  modernCalculator
//
//  Created by Sungur on 15.12.2021.
//

import UIKit

class ViewController: UIViewController {

    
    var currNumber: Double = 0
    var prevNumber: Double = 0
    var math = false
    var operation = 0
    
    @IBOutlet weak var buttonsView: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func buttons(_ sender: UIButton)
    {
    
        if (sender.tag == 13) {
            label.text = ""
            prevNumber = 0
            currNumber = 0
            operation = 0
        }
        if (label.text != "" && sender.tag != 18 && sender.tag != 13) {
            
            prevNumber = Double(label.text!)!
            
            if sender.tag == 14 {       // Divide
                label.text = "/"
            }
            else if sender.tag == 11 {
                label.text = String(currNumber / 100)
            }
            else if sender.tag == 15 {      // Multiply
                label.text = "x"
            }
            else if sender.tag == 16 {      // Minus
                label.text = "-"
            }
            else if sender.tag == 17 {      // plus
                label.text = "+"
            }
            else if sender.tag == 12 {      // +/-
                label.text! =  "-" + String(currNumber)
            }
            
            operation = sender.tag
            math = true
        }
        else if sender.tag == 18 {
            if operation == 14 {
                label.text = String(prevNumber / currNumber)
            }
            else if operation == 15 {
                label.text = String(prevNumber * currNumber)
            }
            else if operation == 16 {
                label.text = String(prevNumber - currNumber)
            }
            else if operation == 17 {
                label.text = String(prevNumber + currNumber)
            }
        }
        
    }
    
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if math {
            label.text = String(sender.tag - 1)
            currNumber = Double(label.text!)!
            math = false
        } else {
            label.text = label.text! + String(sender.tag - 1)
            currNumber = Double(label.text!)!
        }
    
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsView.layer.cornerRadius = 25
        // Do any additional setup after loading the view.
    }


}

