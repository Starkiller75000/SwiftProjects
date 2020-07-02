//
//  RoundedImage.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = frame.width / 2
        self.layer.borderColor = UIColor.systemTeal.cgColor
        self.layer.borderWidth = 4
        contentMode = .scaleAspectFill
    }
    
    func updateRRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }
}
