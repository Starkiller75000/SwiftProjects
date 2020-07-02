//
//  AddController.swift
//  mon jardin secret
//
//  Created by Benoît Bouton on 29/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class AddController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var imageV: UIImageView!
    
    var album: Album?
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageV.isUserInteractionEnabled = true
        picker.delegate = self
        picker.allowsEditing = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            view.endEditing(true)
            if touch.view == imageV {
                AlertHelper().pickerAlert(picker, self)
            }
        }
    }

    @IBAction func validatePressed(_ sender: Any) {
        if imageV.image != nil, album != nil {
            CoreDataHelper().addElement(textField.text, textView.text, imageV.image, album!) { (err) in
                if err != nil {
                    AlertHelper().errorAlert(err!, self)
                } else {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        } else {
            AlertHelper().errorAlert("Prenez d'abord une photo", self)
        }
    }
}

extension AddController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageV.image = info[.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
    }
}
