//
//  ElementCell.swift
//  mon jardin secret
//
//  Created by Benoît Bouton on 29/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ElementCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    var element: Element! {
        didSet {
            self.name.text = element.name
            self.picture.image = element.image as? UIImage
        }
    }
}
