//
//  HomeController.swift
//  IntroFaceVision
//
//  Created by Benoît Bouton on 30/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var visionButton: UIButton!
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iv.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(takeAPic))
        iv.addGestureRecognizer(tap)
        picker.delegate = self
        picker.allowsEditing = false
        visionButton.isEnabled = (iv.image != nil)
    }
    
    @objc func takeAPic() {
        AlertHelper().setImage(picker, self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Vision" {
            if let next = segue.destination as? VisionController {
                next.image = sender as? UIImage
            }
        }
    }
    
    @IBAction func visionButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "Vision", sender: iv.image)
    }
    
}

extension HomeController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        iv.image = info[.originalImage] as? UIImage
        picker.dismiss(animated: true, completion: nil)
        visionButton.isEnabled = (iv.image != nil)
    }
}
