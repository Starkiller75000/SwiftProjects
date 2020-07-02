//
//  TeamCell.swift
//  NFLApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class TeamCell: UICollectionViewCell {
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logo: UIImageView!
    
    var team: TeamVM!
    
    func setupCell(_ team: TeamVM) {
        self.team = team
        nameLabel.text = self.team.fullName
        logo.loadFrom(self.team.logo)
        logo.shadow()
        logo.circleView((self.frame.height * 0.75) / 2)
        holderView.shadow()
        holderView.circleView(10)
    }
}
