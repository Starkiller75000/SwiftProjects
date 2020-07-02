//
//  AlertHelper.swift
//  mon jardin secret
//
//  Created by Benoît Bouton on 29/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class AlertHelper {
    func errorAlert(_ message: String, _ controller: UIViewController) {
        let c = UIAlertController(title: "Une erreur est survenue", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        c.addAction(ok)
        controller.present(c, animated: true, completion: nil)
    }
    
    func pickerAlert(_ picker: UIImagePickerController, _ controller: UIViewController) {
        let c = UIAlertController(title: "Prendre une photo", message: "Choisissez le média", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        let cam = UIAlertAction(title: "Appareil photo", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                picker.sourceType = .camera
                controller.present(picker, animated: true, completion: nil)
            }
        }
        let gal = UIAlertAction(title: "Librairie de photos", style: .default) { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                picker.sourceType = .photoLibrary
                controller.present(picker, animated: true, completion: nil)
            }
        }
        c.addAction(cam)
        c.addAction(gal)
        c.addAction(cancel)
        controller.present(c, animated: true, completion: nil)
    }
}
