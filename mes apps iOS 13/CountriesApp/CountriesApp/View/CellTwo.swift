//
//  CellTwo.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class CellTwo: UITableViewCell {
    @IBOutlet weak var flagIV: ShadowView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var country: Country!
    
    func setupCell(_ country: Country) {
        self.country = country
        flagIV.image = self.country.flag
        nameLbl.text = self.country.name
    }
}
