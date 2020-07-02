//
//  Fact.swift
//  BeeFactApp
//
//  Created by Benoît Bouton on 15/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation
import UIKit

class Fact {
    var title: String
    var image: Int
    var desc: String
    
    var imageFormatted: UIImage? {
        return UIImage(named: String(image))
    }
    
    init(title: String, image: Int, desc: String) {
        self.title = title
        self.image = image
        self.desc = desc
    }
}
