//
//  MyFirstCell.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class MyFirstCell: UITableViewCell {
    @IBOutlet weak var flag: RoundedImage!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!
    
    var country: Country! {
        didSet {
            flag.image = country.flag
            nameLbl.text = country.name
            capitalLbl.text = country.capital
        }
    }
    
}
