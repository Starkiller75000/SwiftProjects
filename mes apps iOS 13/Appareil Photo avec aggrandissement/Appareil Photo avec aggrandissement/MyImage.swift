//
//  MyImage.swift
//  Appareil Photo avec aggrandissement
//
//  Created by Benoît Bouton on 18/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class MyImage: UIImageView {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        draw(frame)
        isUserInteractionEnabled = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.circle(rect.width)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        layer.border()
    }
}
