//
//  DetailController.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var iv: ShadowView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!

    var country: Country?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let newCounry = country else { return }
        iv.image = newCounry.flag
        nameLbl.text = newCounry.name
        capitalLbl.text = newCounry.capital
    }
}
