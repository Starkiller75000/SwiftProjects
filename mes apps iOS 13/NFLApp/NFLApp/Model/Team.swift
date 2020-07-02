//
//  Team.swift
//  NFLApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

struct Team: Decodable {
    var team: Identity
    var stadium: Stadium
    var conference: String
    var titles: [Int]
}

struct Identity: Decodable {
    var name: String
    var location: String
    var logo: String
}

struct Stadium: Decodable {
    var name: String
    var capacity: Int
    var image: String
}
