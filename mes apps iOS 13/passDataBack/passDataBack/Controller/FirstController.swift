//
//  FirstController.swift
//  passDataBack
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class FirstController: UIViewController, ColorDelegate {
    @IBOutlet weak var nameColor: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue", let second = segue.destination as? SecondController {
            second.delegate = self
        }
    }
    
    func passColorBack(_ color: Couleur) {
        nameColor.text = color.name
        view.backgroundColor = color.color
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        performSegue(withIdentifier: "Segue", sender: nil)
    }
}
