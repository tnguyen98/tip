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
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "index")
        calculation(percent: tipPercentages[tipControl.selectedSegmentIndex])
        
        
    }
    
    func calculation(percent: Double){
        let bill = Double(billAmountTextField.text!) ?? 0
        print(bill)
        let tip = bill * percent
        let total = bill + tip
        percentLabel.text = percentFormatter.string(from: NSNumber(value: percent))
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func customTipSubmit(_ sender: Any) {
        if(customTip.text != ""){
            calculation(percent: (Double(customTip.text!) ?? 0) / 100)
        } else {
            calculation(percent: tipPercentages[tipControl.selectedSegmentIndex])
        }
        customTip.text = ""
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        calculation(percent: tipPercentages[tipControl.selectedSegmentIndex])
    }
    
    
}

