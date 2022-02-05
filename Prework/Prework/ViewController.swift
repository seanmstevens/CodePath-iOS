//
//  ViewController.swift
//  Prework
//
//  Created by Sean Stevens on 1/23/22.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var currencySymbol: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    // Declare default percentages for initial app load
    static var tipPercentages = [0.15, 0.18, 0.20]
    let formatter = NumberFormatter()
    let currencyFormatter = NumberFormatter()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        // Formatter specification for percentages
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 3
        formatter.maximumFractionDigits = 3
        
        // Formatter specification for currency labels
        currencyFormatter.numberStyle = .currency
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.locale = Locale.current
        
        // Check if app was last opened more than 10 minutes (600 seconds) ago.
        // If so, reset the user defaults
        if let lastModified = defaults.object(forKey: "lastModified") as? NSDate {
            print(String(lastModified.timeIntervalSinceNow))
            if lastModified.timeIntervalSinceNow < -600 {
                UserDefaults.resetDefaults()
            }
        }
        
        defaults.set(NSDate.now, forKey: "lastModified")
        
        // Set tip percentages to user defaults if they exist, use app defaults otherwise
        if let percentages = defaults.object(forKey: "percentages") as? [Double] {
            ViewController.tipPercentages = percentages
        } else {
            defaults.set(ViewController.tipPercentages, forKey: "percentages")
        }
        
        // Update editable controls with user's input, if extant
        tipControl.selectedSegmentIndex = defaults.object(forKey: "percentageIndex") as? Int ?? 0
        billAmountTextField.text = defaults.object(forKey: "bill") as? String ?? String()
        splitStepper.value = defaults.object(forKey: "split") as? Double ?? splitStepper.minimumValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set tip calculator's currency symbol to match user's region
        currencySymbol.text = Locale.current.currencySymbol
        
        // Set segmented control's titles based on tip percentages either retrieved from user defaults,
        // from edits user has made while in the app or from app defaults
        for (index, percentage) in ViewController.tipPercentages.enumerated() {
            tipControl.setTitle(formatter.string(from: NSNumber(value: percentage)), forSegmentAt: index)
        }
        
        updateSplitLabel(splitStepper)
        calculateTip(billAmountTextField!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billAmountTextField.becomeFirstResponder()
        
        // Update app appearance based on user default, if extant
        if let darkMode = defaults.object(forKey: "darkMode") as? Bool {
            view.window?.overrideUserInterfaceStyle = darkMode ? .dark : .light
        }
    }
    
    @IBAction func updateSplitLabel(_ sender: UIStepper) {
        splitLabel.text = String(Int(sender.value))
        defaults.set(splitStepper.value, forKey: "split")
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = bill * ViewController.tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // billAmountTextField.text = formatBillByRegion(inputNumber: bill)
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
        perPersonLabel.text = currencyFormatter.string(from: NSNumber(value: total / splitStepper.value))
        
        // Only save bill amount if it's not an empty field
        if bill > 0.0 {
            defaults.set(String(bill), forKey: "bill")
        } else {
            defaults.removeObject(forKey: "bill")
        }
        // Save selected percentage on tip control segmented control
        defaults.set(tipControl.selectedSegmentIndex, forKey: "percentageIndex")
    }
    
    private func formatBillByRegion(inputNumber: Double) -> String {
        // Unused. Meant to format bill text field as it is being edited
        let numberNS = NSNumber(value: inputNumber)
        return currencyFormatter.string(from: numberNS)!
    }
}

// A custom extension to the UserDefaults API that enables
// easy clearing of any defaults set in current bundle
extension UserDefaults {
    static func resetDefaults() {
        if let bundleId = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleId)
        }
    }
}
