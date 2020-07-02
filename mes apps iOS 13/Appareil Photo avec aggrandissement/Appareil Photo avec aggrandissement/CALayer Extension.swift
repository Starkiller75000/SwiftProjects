//
//  CALayer Extension.swift
//  Appareil Photo avec aggrandissement
//
//  Created by Benoît Bouton on 18/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

extension CALayer {
    func radius(_ radius: CGFloat) {
        cornerRadius = radius
    }
    
    func circle(_ width: CGFloat) {
        cornerRadius = width / 2
    }
    
    func shadow() {
        shadowColor = UIColor.black.cgColor
        shadowRadius = 2
        shadowOffset = CGSize(width: 2, height: 2)
        shadowOpacity = 0.75
    }
    
    func border() {
        borderColor = UIColor.white.cgColor
        borderWidth = 2
    }
}
