//
//  UIViewExtension.swift
//  NFLApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

extension UIView {
    func setupGradient(_ colors: [CGColor]) {
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.locations = [0, 0.5]
        gradient.frame = self.bounds
        layer.insertSublayer(gradient, at: 0)
    }
    
    func circleView(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func shadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
}

extension UIImageView {
    func loadFrom(_ urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
            }
            if let d = data {
                let image = UIImage(data: d)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
