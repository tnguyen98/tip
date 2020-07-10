//
//  SettingsViewController.swift
//  tip
//
//  Created by Timothy Nguyen on 7/9/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

   
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultTipControl.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "index")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func defaultTipChange(_ sender: Any) {
        UserDefaults.standard.set(defaultTipControl.selectedSegmentIndex, forKey: "index")
        UserDefaults.standard.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
