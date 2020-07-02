//
//  CameraController.swift
//  Appareil photo AV
//
//  Created by Benoît Bouton on 30/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class CameraController: UIViewController {
    @IBOutlet weak var cameraView: CameraView!
    
    var picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        NotificationCenter.default.addObserver(self, selector: #selector(notif), name: Notification.Name("image"), object: nil)
    }
    
    @objc func notif(notification: Notification) {
        if let dict = notification.userInfo {
            if let image = dict["image"] as? UIImage {
                performSegue(withIdentifier: "detail", sender: image)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            if let detailVC = segue.destination as? DetailController {
                detailVC.image = sender as? UIImage
            }
        }
    }
    
    @IBAction func actionButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            cameraView.rotate()
        case 1:
            cameraView.takeAPic()
        case 2:
            present(picker, animated: true, completion: nil)
        default:
            break
        }
    }
}

extension CameraController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        picker.dismiss(animated: true) {
            self.performSegue(withIdentifier: "detail", sender: image)
        }
    }
}

