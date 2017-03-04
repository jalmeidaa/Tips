//
//  ViewController.swift
//  tipz
//
//  Created by Julius Almeida on 3/3/17.
//  Copyright © 2017 Julius Almeida. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var stepStepper: UIStepper!

    @IBOutlet weak var currLabel: UILabel!
    
    var data = ["5", "6", "7","8","9","10","11","12","13", "14", "15","16","17","18","19","20","21","22","23","24","25"]
    var picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        tipField.inputView = picker
        billField.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
        calculateTip(sender)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        let tipPer = Double(tipField.text!) ?? 0
        let tip =  bill * tipPer / 100
        
        let total = bill + tip
        
        tipLabel.text = String(format: "%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
        shareLabel.text = String(format: "%.2f", total)
        splitLabel.text = String(1)
        stepStepper.value = 1
        let defaults = UserDefaults.standard
        defaults.set("$ "+totalLabel.text!, forKey: "Total")
    }
    
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return data.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          tipField.text = data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row] + " %"
    }
    
    @IBAction func splitInto(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.f" ,sender.value)
        let indiShare = Double(String(totalLabel.text!).replacingOccurrences(of: " ", with: "")) ?? 0
        let total = indiShare / Double(sender.value)
        shareLabel.text = String(format: "%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")

    }
  
    
}

