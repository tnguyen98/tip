//
//  ViewController.swift
//  tip
//
//  Created by Timothy Nguyen on 7/9/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customTip: UITextField!
    @IBOutlet weak var percentLabel: UILabel!
    
    let currencyFormatter = NumberFormatter()
    let percentFormatter = NumberFormatter()
    let tipPercentages = [0.15, 0.18, 0.2]
    
    func createNumFormatter(){
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        percentFormatter.numberStyle  = .percent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder()
        createNumFormatter()
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back", style: .plain, target: nil, action: nil)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let bill = Double(billAmountTextField.text!) ?? 0
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "index")
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        percentLabel.text = percentFormatter.string(from: NSNumber(value: tipPercentages[tipControl.selectedSegmentIndex]))
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func customTipSubmit(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        var percentage = tipPercentages[tipControl.selectedSegmentIndex]
        if(customTip.text != ""){
            percentage = (Double(customTip.text!) ?? 0) / 100
        }
        let tip = bill * percentage
        let total = bill + tip
        customTip.text = ""
        percentLabel.text = percentFormatter.string(from: NSNumber(value: percentage))
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        percentLabel.text = percentFormatter.string(from: NSNumber(value: tipPercentages[tipControl.selectedSegmentIndex]))
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
//        tipAmountLabel.text = String(format: "$%.2f", tip)
//        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

