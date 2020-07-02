//
//  ViewController.swift
//  Appareil Photo avec aggrandissement
//
//  Created by Benoît Bouton on 18/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var pictureIV: MyImage!
    
    var imagePicker = UIImagePickerController()
    var image: UIImage?
    var imageViewDetail: UIImageView? {
        didSet {
            if imageViewDetail != nil {
                imageViewDetail?.layer.circle(imageViewDetail!.frame.width)
                imageViewDetail?.backgroundColor = .black
                imageViewDetail?.image = self.image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        holderView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        holderView.layer.radius(10)
        holderView.layer.shadow()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(showDetail))
        pictureIV.addGestureRecognizer(tap)
    }
    
    @objc func showDetail() {
        guard imageViewDetail == nil else { return }
        removeDetail()
        let frame = view.convert(pictureIV.frame, to: holderView)
        imageViewDetail = UIImageView(frame: frame)
        view.addSubview(imageViewDetail!)
        UIView.animate(withDuration: 1, animations: {
            self.imageViewDetail?.frame = self.view.bounds
            self.imageViewDetail?.layer.radius(0)
            self.imageViewDetail?.contentMode = .scaleAspectFit
        }) { (success) in
        }
    }
    
    func hideDetail() {
        let frame = view.convert(pictureIV.frame, to: holderView)
        UIView.animate(withDuration: 1, animations: {
            self.imageViewDetail?.frame = frame
            self.imageViewDetail?.layer.radius(self.pictureIV.frame.width / 2)
        }) { (success) in
            self.removeDetail()
        }
    }
    
    func removeDetail() {
        if imageViewDetail != nil {
            imageViewDetail?.removeFromSuperview()
            imageViewDetail = nil
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if imageViewDetail != nil {
            hideDetail()
        }
    }
    
    @IBAction func takeAPic(_ sender: UIButton) {
        let source: UIImagePickerController.SourceType = (sender.tag == 0) ? .camera : .photoLibrary
        if UIImagePickerController.isSourceTypeAvailable(source) {
            imagePicker.sourceType = source
            present(imagePicker, animated: true, completion: nil)
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        image = info[.originalImage] as? UIImage
        pictureIV.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
