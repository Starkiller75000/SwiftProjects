//
//  CameraView.swift
//  Appareil photo AV
//
//  Created by Benoît Bouton on 30/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIView {
    
    var position = AVCaptureDevice.Position.back
    var session: AVCaptureSession?
    var output: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCamera()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCamera()
    }
    
    func setupCamera() {
        previewLayer?.removeFromSuperlayer()
        session = AVCaptureSession()
        if session != nil {
            if let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: position) {
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    if session!.canAddInput(input) {
                        session?.addInput(input)
                        output = AVCapturePhotoOutput()
                        if output != nil {
                            if session!.canAddOutput(output!) {
                                session!.addOutput(output!)
                                previewLayer = AVCaptureVideoPreviewLayer(session: session!)
                                previewLayer?.videoGravity = .resizeAspectFill
                                previewLayer?.connection?.videoOrientation = .portrait
                                previewLayer?.frame = self.bounds
                                if previewLayer != nil {
                                    self.layer.addSublayer(previewLayer!)
                                    session!.startRunning()
                                    } else {
                                    print("No preview")
                                }
                            }
                        } else {
                            print("Output non init")
                        }
                    } else {
                        print("Ne peut pas ajouter input")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                print("Impossible de créer la device")
            }
        } else {
            print("Aucune session")
        }
    }
    
    func rotate() {
        position = (position == .back) ? .front : .back
        setupCamera()
    }
    
    func takeAPic() {
        guard let out = output else {
            return
        }
        let settings = AVCapturePhotoSettings()
        out.capturePhoto(with: settings, delegate: self)
    }
}

extension CameraView: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let err = error {
            print(err.localizedDescription)
        }
        if let data = photo.fileDataRepresentation() {
            if let image = UIImage(data: data) {
                //Notifier au controller que la photo a été prise
                NotificationCenter.default.post(name: Notification.Name("image"), object: nil, userInfo: ["image": image])
            }
        }
    }
}
