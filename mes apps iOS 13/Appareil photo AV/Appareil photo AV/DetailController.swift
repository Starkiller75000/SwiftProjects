//
//  DetailController.swift
//  Appareil photo AV
//
//  Created by Benoît Bouton on 01/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit
import CoreML
import Vision

class DetailController: UIViewController {
    @IBOutlet weak var imageViewTaken: UIImageView!
    @IBOutlet weak var mlLabel: UILabel!
    
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewTaken.image = image
        makeRequest()
    }
    
    func makeRequest() {
        if let cgImage = image?.cgImage {
            let mlModel = SqueezeNet().model
            do {
                let visionModel = try VNCoreMLModel(for: mlModel)
                let request = VNCoreMLRequest(model: visionModel, completionHandler: completion)
                let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
                try handler.perform([request])
            } catch {
                print(error.localizedDescription)
            }
        } else {
            print("Ne peut pas convertir image")
        }
    }
    
    func completion(_ request: VNRequest, _ error: Error?) {
        DispatchQueue.main.async {
            if let err = error {
                print(err.localizedDescription)
            }
            if let response = request.results as? [VNClassificationObservation] {
                response.forEach { (o) in
                    print(o.identifier)
                    if let first = response.first {
                        self.mlLabel.text = "Je suis sûr à \(Int(first.confidence * 100))% \n Que ceci est: \(first.identifier)"
                    }
                }
            }
        }
    }
}
