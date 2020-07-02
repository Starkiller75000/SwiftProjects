//
//  DetailController.swift
//  learnNavigation
//
//  Created by Benoît Bouton on 17/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class DetailController: UIViewController {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    var dataTexte: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if dataTexte != nil {
            detailLabel.text = dataTexte!
        } else {
            detailLabel.text = "Aucune donnée"
        }
        if navigationController != nil {
            closeBtn.isHidden = true
        } else {
            closeBtn.isHidden = false
        }
    }
    
    @IBAction func closeView(_ sender: Any) {
        if navigationController != nil {
            //Avec Nav
            navigationController?.popViewController(animated: true)
        } else {
            //Pas de Nav
            dismiss(animated: true, completion: nil)
        }
    }
}
