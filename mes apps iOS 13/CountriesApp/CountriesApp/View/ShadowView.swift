//
//  ShadowView.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ShadowView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayer()
    }
    
    func setupLayer() {
        clipsToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 2, height: 3)
    }
    
}
