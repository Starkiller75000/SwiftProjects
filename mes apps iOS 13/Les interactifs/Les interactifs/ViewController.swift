//
//  ViewController.swift
//  Les interactifs
//
//  Created by Benoît Bouton on 16/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var switchLBl: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLbl: UILabel!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var segmentedLbl: UILabel!
    @IBOutlet weak var minLbl: UILabel!
    @IBOutlet weak var maxLbl: UILabel!
    @IBOutlet weak var sliderLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var pickerV: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var pickerArray = ["Marseille", "Cassis", "La Ciotat", "Saint Cyr", "Bandol", "Sanary", "Six fours", "La Seyne", "Toulon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        pickerV.delegate = self
        pickerV.dataSource = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        updateSwitchLabel()
        updateStepperLabel()
        segmented.selectedSegmentIndex = 2
        segmented.selectedSegmentTintColor = .systemPink
        segmented.backgroundColor = .systemTeal
        updatedSegmentedLabel()
        
        slider.minimumTrackTintColor = .systemPink
        slider.maximumTrackTintColor = .systemYellow
        slider.thumbTintColor = .systemTeal
        
        minLbl.text = "min: \(Int(slider.minimumValue))"
        maxLbl.text = "max: \(Int(slider.maximumValue))"
        updateSliderLabel()
    }
    
    //1. Avec GestureReconizer
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    //2. Avec touches
    /*override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }*/
    
    func updateSwitchLabel() {
        switchLBl.text = "Valeur du Switch: " + String(mySwitch.isOn)
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateSwitchLabel()
    }
    
    func updateStepperLabel() {
        let number = Int(stepper.value)
        stepperLbl.text = "Nombre choisi: \(number)"
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        updateStepperLabel()
    }
    
    func updatedSegmentedLabel() {
        let index = segmented.selectedSegmentIndex
        segmentedLbl.text = "Element choisi: \(index)"
    }
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        updatedSegmentedLabel()
    }
    
    func updateSliderLabel() {
        let value = Int(slider.value)
        sliderLbl.text = "Valeur: \(value)"
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateSliderLabel()
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        print(datePicker.date)
    }
}

extension ViewController : UITextFieldDelegate {
    
    //3. avec le bouton return + delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("End Editing \(String(describing: textField.text))")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did Begin \(String(describing: textField.text))")
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Change Selection \(String(describing: textField.text))")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("Should Clear \(String(describing: textField.text))")
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("Should End Editing \(String(describing: textField.text))")
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("Should Begin Editing \(String(describing: textField.text))")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("Did End Editing \(String(describing: textField.text)), \(reason)")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Range\(range.length), \(range.location), string \(string)")
        return true
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("Element choisi: \(pickerArray[row])")
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }
    
}
