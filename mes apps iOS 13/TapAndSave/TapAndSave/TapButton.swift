//
//  TapButton.swift
//  TapAndSave
//
//  Created by Benoît Bouton on 23/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class TapButton: UIButton {
    func setup(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.borderColor = UIColor.label.cgColor
        layer.borderWidth = 4
        tintColor = .white
        backgroundColor = .systemRed
    }
}
