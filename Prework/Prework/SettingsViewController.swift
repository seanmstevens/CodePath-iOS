//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sean Stevens on 2/2/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOneField: UITextField!
    @IBOutlet weak var tipTwoField: UITextField!
    @IBOutlet weak var tipThreeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
        
        tipOneField.placeholder = String(Int(ViewController.tipPercentages[0] * 100))
        tipTwoField.placeholder = String(Int(ViewController.tipPercentages[1] * 100))
        tipThreeField.placeholder = String(Int(ViewController.tipPercentages[2] * 100))
    }
    
    @IBAction func onTipPercentageChange(_ sender: UITextField) {
        guard let text = sender.text, !sender.text!.isEmpty else {
            return
        }
        
        ViewController.tipPercentages[sender.tag] = Double(text)! / 100
    }
    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        tipOneField.text = String(ViewController.tipPercentages[0])
//        tipTwoField.text = String(ViewController.tipPercentages[1])
//        tipThreeField.text = String(ViewController.tipPercentages[2])
//    }

}
