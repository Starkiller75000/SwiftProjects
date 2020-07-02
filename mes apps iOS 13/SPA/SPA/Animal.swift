//
//  Animal.swift
//  SPA
//
//  Created by Benoît Bouton on 17/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

struct Animal {
    var name: String
    var image: UIImage?
    var range: Int
    var sevre: Bool
    var sociability: Int
    var date: String
    var type: AnimalType
}

enum AnimalType: String {
    case chat
    case chien
    case autre
}
