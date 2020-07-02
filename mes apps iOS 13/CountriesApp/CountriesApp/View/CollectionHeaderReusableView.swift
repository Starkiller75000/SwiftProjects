//
//  CollectionHeaderReusableView.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class CollectionHeaderReusableView: UICollectionReusableView {
    @IBOutlet weak var headerLbl: UILabel!
    
    var str: String! {
        didSet {
            headerLbl.text = str
        }
    }
}
