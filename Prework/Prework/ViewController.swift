//
//  ViewController.swift
//  Prework
//
//  Created by Sean Stevens on 1/23/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    static var tipPercentages = [0.15, 0.18, 0.20]
    let formatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 3
        formatter.maximumFractionDigits = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for (index, percentage) in ViewController.tipPercentages.enumerated() {
            tipControl.setTitle(formatter.string(from: NSNumber(value: percentage)), forSegmentAt: index)
        }
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = bill * ViewController.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func handleEditorChange(_ sender: Any) {
        calculateTip(billAmountTextField!)
    }
    
}

