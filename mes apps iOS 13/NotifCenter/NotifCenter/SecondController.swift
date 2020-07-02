//
//  SecondController.swift
//  NotifCenter
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class SecondController: UIViewController {
    
    var colors: [UIColor] = [.red, .green, .black, .brown, .gray, .yellow, .purple, .systemPink]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnPressed(_ sender: Any?) {
        let indexRandom: Int = Int.random(in: 0..<colors.count)
        let color = colors[indexRandom]
        NotificationCenter.default.post(name: Notification.Name("ChangeBG"), object: color, userInfo: ["color": color])
    }
}
