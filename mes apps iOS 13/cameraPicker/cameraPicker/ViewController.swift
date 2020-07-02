//
//  ViewController.swift
//  cameraPicker
//
//  Created by Benoît Bouton on 16/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageHolder: UIImageView!
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    
    func takePicture(source: UIImagePickerController.SourceType) {
        imagePicker.sourceType = source
        imagePicker.allowsEditing = mySwitch.isOn
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func switchChanged(_ sender: Any) {
        switchLabel.text = mySwitch.isOn ? "Editable" : "Original"
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            takePicture(source: .camera)
        } else {
            print("Camera non disponible")
        }
    }
    
    @IBAction func libraryPressed(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            takePicture(source: .photoLibrary)
        } else {
            print("Aucune gallerie de photo")
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Récupérer des infos sur ce que l'on a pris
        if let pictureEdited = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            //Attribuer l'image
            imageHolder.image = pictureEdited
        } else if let original = info[.originalImage] as? UIImage {
            imageHolder.image = original
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

