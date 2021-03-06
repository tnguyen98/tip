//
//  ViewController.swift
//  tip
//
//  Created by Timothy Nguyen on 7/9/20.
//  Copyright © 2020 Codepath. All rights reserved.
//
/*
Source for show/hide calculations animation:
https://stackoverflow.com/questions/50851374/animation-show-and-hide-view-in-swift
*/

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var customTip: UITextField!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var calculationsView: UIView!
    @IBOutlet weak var splitView: UIView!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitField: UITextField!
    
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
        calculationsView.isHidden = true
        splitView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "index")
        calculateTip(self)
        
    }
    
    func calculation(percent: Double){
        self.calculationsView.alpha = 0
        calculationsView.isHidden = false
        UIView.animate(withDuration: 0.6,
                       animations: { [weak self] in
                        self?.calculationsView.alpha = 1.0
        })
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * percent
        let total = bill + tip
        let split = Double(splitField.text!) ?? 1
        let splitTotal = total / split
        splitLabel.text = currencyFormatter.string(from: NSNumber(value: splitTotal))
        percentLabel.text = percentFormatter.string(from: NSNumber(value: percent))
        tipAmountLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))
        
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        if billAmountTextField.text?.isEmpty ?? true{
            UIView.animate(withDuration: 0.6,
                           animations: { [weak self] in
                            self?.calculationsView.alpha = 0.0
            }) { [weak self] _ in
                self?.calculationsView.isHidden = true
            }
        } else {
            if splitField.text?.isEmpty ?? true {
                print("split is empty")
                UIView.animate(withDuration: 0.6,
                               animations: { [weak self] in
                                self?.splitView.alpha = 0.0
                }) { [weak self] _ in
                    self?.splitView.isHidden = true
                }
            } else {
                self.splitView.alpha = 0
                splitView.isHidden = false
                UIView.animate(withDuration: 0.6,
                               animations: { [weak self] in
                                self?.splitView.alpha = 1.0
                })
            }
            
            if customTip.text?.isEmpty ?? true {
                calculation(percent: tipPercentages[tipControl.selectedSegmentIndex])
            } else {
                calculation(percent: (Double(customTip.text!) ?? 0) / 100)
            }
        }

    }
    

    
}

