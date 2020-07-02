//
//  God.swift
//  GreekGodsApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class God {
    var name: String
    var desc: String
    var image: UIImage? {
        let imageAccent = name.lowercased()
        let imageNoAccent = imageAccent.replacingOccurrences(of: "é", with: "e").replacingOccurrences(of: "è", with: "e")
        return UIImage(named: imageNoAccent)
    }
    
    init(name: String, desc: String) {
        self.name = name
        self.desc = desc
    }
}
