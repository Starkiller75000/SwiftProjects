//
//  MyCollecCellTwo.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class MyCollecCellTwo: UICollectionViewCell {
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var flagIV: ShadowView!
    
    var country: Country!
    
    func setupCell(country: Country) {
        self.country = country
        self.countryLbl.text = self.country.name
        self.flagIV.image = self.country.flag
        contentView.layer.cornerRadius = 25
        contentView.backgroundColor = UIColor(red: 230 / 255, green: 230 / 255, blue: 230 / 255, alpha: 1)
    }
}
