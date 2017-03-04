//
//  SettingsViewController.swift
//  tipz
//
//  Created by Julius Almeida on 3/3/17.
//  Copyright © 2017 Julius Almeida. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var billLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billLabel.text = UserDefaults.standard.string(forKey:"Total")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billLabel.text = UserDefaults.standard.string(forKey:"Total")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        billLabel.text = "$ 0.00"   }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       billLabel.text = "$ 0.00"   }
}
