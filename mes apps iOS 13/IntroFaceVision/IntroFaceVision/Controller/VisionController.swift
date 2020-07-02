//
//  VisionController.swift
//  IntroFaceVision
//
//  Created by Benoît Bouton on 30/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit
import Vision

class VisionController: UIViewController {
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var iv: UIImageView!
    
    var image: UIImage?
    var visionType: TypeVision = .box

    override func viewDidLoad() {
        super.viewDidLoad()
        iv.image = image
        performVision()
    }
    
    func performVision() {
        //0. Supprimer les layers
        iv.subviews.forEach { (v) in
            v.removeFromSuperview()
        }
        iv.layer.sublayers?.forEach({ (l) in
            l.removeFromSuperlayer()
        })
        //1. Convertir Image
        if let cg = convertImage() {
            //2. Request
            var request: VNRequest!
            switch visionType {
            case .box: request = VNDetectFaceRectanglesRequest(completionHandler: visionCompletion)
            case .landmarks: request = VNDetectFaceLandmarksRequest(completionHandler: visionCompletion)
            case .redNose: request = VNDetectFaceLandmarksRequest(completionHandler: visionCompletion)
            }
            //3. handler
            let handler = VNImageRequestHandler(cgImage: cg, options: [:])
            //4. perform request
            do {
                try handler.perform([request])
            } catch {
                AlertHelper().errorAlert(error.localizedDescription, self)
            }
        } else {
            AlertHelper().errorAlert("Image non convertible", self)
        }
    }
    
    func visionCompletion(_ request: VNRequest, _ error: Error?) {
        DispatchQueue.main.async {
            if error != nil {
                AlertHelper().errorAlert(error!.localizedDescription, self)
            }
            if let results = request.results as? [VNFaceObservation] {
                results.forEach { (face) in
                    switch self.visionType {
                    case .box: self.iv.layer.addSublayer(LayerElement(self.convertBounding(face.boundingBox)))
                    case .landmarks: self.convertLandMarks(face: face)
                    case .redNose: self.setNose(face: face)
                    }
                }
            }
        }
    }
    
    func setNose(face: VNFaceObservation) {
        let box = face.boundingBox
        if let landmarks = face.landmarks, let nose = landmarks.nose {
            let nosePoints = convertPoints(nose.normalizedPoints, box)
            if let first = nosePoints.first {
                var minX = first.x
                var maxX = first.x
                var minY = first.y
                var maxY = first.y
                nosePoints.forEach { (p) in
                    minX = (p.x < minX) ? p.x : minX
                    maxX = (p.x > maxX) ? p.x : maxX
                    minY = (p.y < minY) ? p.y : minY
                    maxY = (p.y > maxY) ? p.y : maxY
                }
                let size = maxX - minX
                let noseIV = UIImageView(image: UIImage(named: "nose"))
                noseIV.frame = CGRect(x: minX, y: maxY - size, width: size, height: size)
                iv.addSubview(noseIV)
            }
        }
    }
    
    func convertLandMarks(face: VNFaceObservation) {
        if let landmarks = face.landmarks {
            let box = face.boundingBox
            let elements = landmarks.getElements()
            elements.forEach { (element) in
                let points = convertPoints(element, box)
                let layer = LayerElement(points)
                self.iv.layer.addSublayer(layer)
            }
        }
    }
    
    func convertPoints(_ points: [CGPoint], _ boundingBox: CGRect) -> [CGPoint] {
        var pointsConverted = [CGPoint]()
        let box = convertBounding(boundingBox)
        let height = getImageRect().height * boundingBox.height
        points.forEach { (point) in
            let x = point.x * box.width + box.origin.x
            let y = (point.y * (1 - box.height)) + box.origin.y + height
            pointsConverted.append(CGPoint(x: x, y: y))
        }
        return pointsConverted
    }
    
    func convertBounding(_ box: CGRect) -> CGRect {
        let imageRect = getImageRect()
        let x = (imageRect.width * box.origin.x) + imageRect.minX
        let width = imageRect.width * box.width
        let height = imageRect.height * box.height
        let y = (imageRect.height * (1 - box.origin.y) - height) + imageRect.minY
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func getImageRect() -> CGRect {
        let ivFrame = iv.frame
        let imageSize = iv.image?.size ?? CGSize(width: 0, height: 0)
        let x: CGFloat = 0
        let width = ivFrame.width
        let height = width / imageSize.width * imageSize.height
        let y = (ivFrame.height / 2) - (height / 2)
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func convertImage() -> CGImage? {
        if image != nil {
            if let cgImage = image!.cgImage {
                return cgImage
            }
        }
        return nil
    }

    @IBAction func segmentedPressed(_ sender: Any) {
        visionType = TypeVision(rawValue: segmented.selectedSegmentIndex) ?? .box
        performVision()
    }
}


extension VNFaceLandmarks2D {
    func getElements() -> [[CGPoint]] {
        var points = [[CGPoint]]()
        if let nose = self.nose {
            points.append(nose.normalizedPoints)
        }
        if let contour = self.faceContour {
            points.append(contour.normalizedPoints)
        }
        if let leftEye = self.leftEye {
            points.append(leftEye.normalizedPoints)
        }
        if let rightEye = self.rightEye {
            points.append(rightEye.normalizedPoints)
        }
        return points
    }
}
