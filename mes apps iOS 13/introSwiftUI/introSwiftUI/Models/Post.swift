//
//  Post.swift
//  introSwiftUI
//
//  Created by Benoît Bouton on 02/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

struct Post: Identifiable {
    var id = UUID()
    var imageUrl: String
    var text: String
    var isLike: Bool
    var user: User
}
