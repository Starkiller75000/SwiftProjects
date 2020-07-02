//
//  Cell.swift
//  passDataBack
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var colorName: UILabel!
    
    var color: Couleur! {
        didSet {
            holderView.layer.cornerRadius = 20
            holderView.backgroundColor = color.color
            colorName.text = color.name
        }
    }
}
