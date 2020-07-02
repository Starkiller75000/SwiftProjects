//
//  MyCollecCellOne.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class MyCollecCellOne: UICollectionViewCell {
    @IBOutlet weak var roundedIV: RoundedImage!
    
    var country: Country! {
        didSet {
            roundedIV.image = country.flag
            roundedIV.updateRRadius(radius: frame.width / 2)
        }
    }
    
}
