//
//  DetailController.swift
//  GreekGodsApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    
    var god: God?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let newGod = god {
            configureController(newGod)
        }
    }
    
    func configureController(_ god: God) {
        nameLbl.text = god.name
        descLbl.text = god.desc
        imageView.image = god.image
    }
}
