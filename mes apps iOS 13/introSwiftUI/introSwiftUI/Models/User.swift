//
//  User.swift
//  introSwiftUI
//
//  Created by Benoît Bouton on 02/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var name: String
    var surname: String
    var imageUrl: String
}
