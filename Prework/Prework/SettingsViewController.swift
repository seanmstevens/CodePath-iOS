//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sean Stevens on 2/2/22.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOneField: UITextField!
    @IBOutlet weak var tipTwoField: UITextField!
    @IBOutlet weak var tipThreeField: UITextField!
    @IBOutlet weak var darkModeToggle: UISwitch!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
        
        tipOneField.placeholder = String(Int(ViewController.tipPercentages[0] * 100))
        tipTwoField.placeholder = String(Int(ViewController.tipPercentages[1] * 100))
        tipThreeField.placeholder = String(Int(ViewController.tipPercentages[2] * 100))
        
        // Case where user apppearance mode is set
        if let darkMode = defaults.object(forKey: "darkMode") as? Bool {
            darkModeToggle.isOn = darkMode
        } else {
            // Case where user appearance preference is not set, use system value
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
                darkModeToggle.isOn = false
            case .dark:
                darkModeToggle.isOn = true
            @unknown default:
                darkModeToggle.isOn = false
            }
        }
    }
    
    @IBAction func onTipPercentageChange(_ sender: UITextField) {
        // Early return if the text field's value is nil or if it's empty
        guard let text = sender.text, !sender.text!.isEmpty else {
            return
        }
        
        // Otherwise, we'll update the default tip percentage for the given tag
        ViewController.tipPercentages[sender.tag] = Double(text)! / 100
        defaults.set(ViewController.tipPercentages, forKey: "percentages")
    }
    
    @IBAction func toggleViewMode(_ sender: UISwitch) {
        // Update window's user interface style based on switch state
        view.window?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
        defaults.set(sender.isOn, forKey: "darkMode")
    }
}
