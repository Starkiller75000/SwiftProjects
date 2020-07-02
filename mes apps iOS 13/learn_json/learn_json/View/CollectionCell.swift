//
//  CollectionCell.swift
//  learn_json
//
//  Created by Benoît Bouton on 24/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var myImageView: CircleIV!
    
    var urlString: String! {
        didSet {
            myImageView.loadFrom(urlString)
        }
    }
}
