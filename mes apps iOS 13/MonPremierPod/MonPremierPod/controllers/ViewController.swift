//
//  ViewController.swift
//  MonPremierPod
//
//  Created by Benoît Bouton on 02/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit
import AMTabView

class ViewController: AMTabsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let settings = AMTabView.settings
        settings.ballColor = .systemTeal
        settings.tabColor = .lightGray
        settings.unSelectedTabTintColor = .systemRed
        settings.selectedTabTintColor = .white
        settings.animationDuration = 2
        //1. Obtention du Storyboard
        let storyboards = UIStoryboard(name: "Main", bundle: nil)
        
        //2. instantiation des controllers
        let one = storyboards.instantiateViewController(withIdentifier: "One")
        let two = storyboards.instantiateViewController(withIdentifier: "Two")
        let three = storyboards.instantiateViewController(withIdentifier: "Three")
        
        //3. Ajout des controllers dans l'array prévu à cet effet.
        viewControllers = [one, two, three]
    }
}

