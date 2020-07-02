//
//  AnimalController.swift
//  SPA
//
//  Created by Benoît Bouton on 17/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var animalIV: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sociabilityLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var sevreLabel: UILabel!
    @IBOutlet weak var porteeLabel: UILabel!
    @IBOutlet weak var closeBtn: UIButton!
    
    var animal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if navigationController != nil {
            closeBtn.isHidden = true
        } else {
            closeBtn.isHidden = false
        }
        
        if let pet = animal {
            typeLabel.text = pet.type.rawValue
            typeLabel.layer.cornerRadius = 40
            typeLabel.clipsToBounds = true
            nameLabel.text = pet.name
            sociabilityLabel.text = "Sociabilité: \(pet.sociability)%"
            dobLabel.text = "Né le: " + pet.date
            sevreLabel.text = pet.sevre ? "Sevré" : "Non Sevré"
            porteeLabel.text = "Nombre dans la portée: \(pet.range)"
            setupImage(pet: pet)
        }
    }
    
    func setupImage(pet: Animal) {
        animalIV.layer.cornerRadius = animalIV.frame.width / 2
        animalIV.layer.borderColor = UIColor.systemBackground.cgColor
        animalIV.layer.borderWidth = 4
        if pet.image != nil {
            animalIV.image = pet.image
        } else {
            animalIV.image = UIImage(named: pet.type.rawValue)
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
