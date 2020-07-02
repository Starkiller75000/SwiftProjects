//
//  ViewController.swift
//  Quel Swift
//
//  Created by Benoît Bouton on 03/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var appTitle: UILabel!

    let texts: Array<String> = ["Appuyez sur un bouton", "Swift une voiture", "En anglais, Swift est une espèce d'oiseau (d'ou le logo)", "Ca c'est nous", "Haters gonna hate ..."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image.layer.cornerRadius = 20
    }

    @IBAction func onButtonTap(_ sender: UIButton) {
        appTitle.text = texts[sender.tag]
        image.image = UIImage(named: "image (\(sender.tag))")
    }
    
}

