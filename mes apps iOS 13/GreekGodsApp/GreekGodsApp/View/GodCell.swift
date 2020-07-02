//
//  GodCell.swift
//  GreekGodsApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class GodCell: UITableViewCell {
    @IBOutlet weak var iv: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var god: God!
    
    func setupCell(_ god: God) {
        self.god = god
        nameLbl.text = self.god.name
        descLbl.text = self.god.desc
        iv.image = self.god.image
    }
}
