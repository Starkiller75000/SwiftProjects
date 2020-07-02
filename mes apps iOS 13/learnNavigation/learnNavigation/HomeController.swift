//
//  HomeController.swift
//  learnNavigation
//
//  Created by Benoît Bouton on 17/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            if let destination = segue.destination as? DetailController {
                if let data = sender as? String {
                    destination.dataTexte = data
                } else {
                    destination.dataTexte = "Ma première donnée passée"
                }
            }
        }
    }
    
    @IBAction func passData(_ sender: UIButton) {
        performSegue(withIdentifier: "Segue", sender: nil)
    }
}
