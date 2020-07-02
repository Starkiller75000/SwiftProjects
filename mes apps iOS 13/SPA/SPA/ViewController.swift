//
//  ViewController.swift
//  SPA
//
//  Created by Benoît Bouton on 16/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageHolder: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var stepperLbl: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var switchLbl: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLbl: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var imagePicker = UIImagePickerController()
    let segueID = "ToDetail"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        textField.delegate = self
        updateStepperLabel()
        updateSliderLabel()
        updateSwitchLabel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID {
            if let next = segue.destination as? DetailController {
                next.animal = sender as? Animal
            }
        }
    }
    
    func updateStepperLabel() {
        let number = Int(stepper.value)
        stepperLbl.text = "Nombre dans la portée: \(number)"
    }
    
    func updateSliderLabel() {
        let value = Int(slider.value)
        sliderLbl.text = "Sociabilité: \(value)%"
    }
    
    func updateSwitchLabel() {
        switchLbl.text = mySwitch.isOn ? "Sevré" : "Non sevré"
    }
    
    func getDate() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter.string(from: datePicker.date)
    }
    
    func getType() -> AnimalType {
        switch segmented.selectedSegmentIndex {
        case 0:
            return .chien
        case 1:
            return .chat
        default:
            return .autre
        }
    }
    
    @IBAction func imagePick(_ sender: UIButton) {
        if sender.tag == 0 && UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addPressed(_ sender: Any) {
        guard let name = textField.text, name != "" else { return }
        let animal = Animal(name: name, image: imageHolder.image, range: Int(stepper.value), sevre: mySwitch.isOn, sociability: Int(slider.value), date: getDate(), type: getType())
        performSegue(withIdentifier: segueID, sender: animal)
    }
    
    @IBAction func stepperPressed(_ sender: Any) {
        updateStepperLabel()
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        updateSliderLabel()
    }
    
    @IBAction func switchPressed(_ sender: Any) {
        updateSwitchLabel()
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let original = info[.originalImage] as? UIImage{
            imageHolder.image = original
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
