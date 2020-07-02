//
//  AlertHelper.swift
//  IntroFaceVision
//
//  Created by Benoît Bouton on 30/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class AlertHelper {
    func setImage(_ picker: UIImagePickerController, _ controller: UIViewController) {
        let c = UIAlertController(title: "Prendre une photo", message: "Quel type de média souhaitez vous utiliser?", preferredStyle: .alert)
        let photo = UIAlertAction(title: "Appareil Photo", style: .default) { (action) in
            self.checkSource(picker, controller, .camera)
        }
        let gallery = UIAlertAction(title: "Librairie de photos", style: .default) { (action) in
            self.checkSource(picker, controller, .photoLibrary)
        }
        let cancel = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        c.addAction(photo)
        c.addAction(gallery)
        c.addAction(cancel)
        controller.present(c, animated: true, completion: nil)
    }
    
    func checkSource(_ picker: UIImagePickerController, _ controller: UIViewController, _ source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            picker.sourceType = source
            controller.present(picker, animated: true, completion: nil)
        } else {
            errorAlert("Média non disponible", controller)
        }
    }
    
    func errorAlert(_ message: String, _ controller: UIViewController) {
        let c = UIAlertController(title: "Erreur", message: message, preferredStyle: .alert)
        c.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        controller.present(c, animated: true, completion: nil)
    }
}
