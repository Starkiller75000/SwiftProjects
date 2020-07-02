//
//  ViewController.swift
//  Alert, Timer et UserDef
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var alertBtn: UIButton!
    @IBOutlet weak var dataLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var acBtn: UIButton!
    
    let userDefaults = UserDefaults.standard
    var timer = Timer()
    var timeRemaining = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLbl.text = getData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //Timer
    func setupTimer() {
        acBtn.isEnabled = false
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (time) in
            self.timeRemaining -= 1
            self.timeLbl.text = String(self.timeRemaining)
            if self.timeRemaining <= 0 {
                self.stopTimer()
            }
        })
    }
    
    func stopTimer() {
        acBtn.isEnabled = true
        timer.invalidate()
    }
    
    @IBAction func startBtn(_ sender: Any) {
        setupTimer()
    }
    
    @IBAction func stopBtn(_ sender: Any) {
        stopTimer()
    }
    
    // UserDefaults
    // KEY & VALUE
    func saveData(string: String?) {
        userDefaults.set(string, forKey: "Text")
    }
    
    func getData() -> String {
        userDefaults.string(forKey: "Text") ?? "Aucune données"
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        if let text = textField.text, text != "" {
            saveData(string: text)
            dataLbl.text = getData()
        }
    }
    // Actions
    
    @IBAction func alertButton(_ sender: Any) {
        let controller = UIAlertController(title: "User Defaults", message: "Vous avez sauvegardé la String: \(getData())", preferredStyle: .alert)
        let reset = UIAlertAction(title: "Remise à zéro", style: .destructive) { (action) in
            self.saveData(string: nil)
            self.dataLbl.text = self.getData()
        }
        let cancel = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        controller.addAction(cancel)
        controller.addAction(reset)
        /*let close = UIAlertAction(title: "Color Blue", style: .cancel) { (action)
            in
            self.alertBtn.tintColor = .blue
        }
        controller.addAction(close)
        let destructive = UIAlertAction(title: "Color red", style: .destructive) { (action) in
            self.alertBtn.tintColor = .red
        }
        controller.addAction(destructive)
        let defaultAction = UIAlertAction(title: "Color Green", style: .default) { (action)
            in
            self.alertBtn.tintColor = .green
        }
        controller.addAction(defaultAction)*/
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func actionSheetButton(_ sender: UIButton) {
        let controller = UIAlertController(title: "Action Sheet", message: "Ma première action sheet", preferredStyle: .actionSheet)
        let five = UIAlertAction(title: "5 secondes", style: .default) { (action) in
            self.timeRemaining = 5
            self.timeLbl.text = String(self.timeRemaining)
        }
        let ten = UIAlertAction(title: "10 secondes", style: .default) { (action) in
            self.timeRemaining = 10
            self.timeLbl.text = String(self.timeRemaining)
        }
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        controller.addAction(five)
        controller.addAction(ten)
        controller.addAction(cancel)
        if UIDevice.current.userInterfaceIdiom == .pad {
            controller.popoverPresentationController?.sourceView = self.view
            controller.popoverPresentationController?.sourceRect = sender.frame
            controller.popoverPresentationController?.permittedArrowDirections = .down
        }
        present(controller, animated: true, completion: nil)
    }
}

