//
//  DetailController.swift
//  NFLApp
//
//  Created by Benoît Bouton on 24/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var stadiumIV: UIImageView!
    @IBOutlet weak var confIV: UIImageView!
    @IBOutlet weak var logoIV: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var stadiumLbl: UILabel!
    @IBOutlet weak var champsLbl: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var team: TeamVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let t = team {
            setupTeam(t)
        }
    }
    
    func setupTeam(_ team: TeamVM) {
        confIV.image = team.conf
        logoIV.loadFrom(team.logo)
        //stadiumIV.loadFrom(team.stadiumUrl)
        nameLbl.text = team.fullName
        stadiumLbl.text = team.stadiumInfo
        champsLbl.text = team.champs
        self.activity.isHidden = false
        self.activity.startAnimating()
        team.image { (i) in
            self.activity.stopAnimating()
            self.activity.isHidden = true
            self.stadiumIV.image = i
        }
    }
}
