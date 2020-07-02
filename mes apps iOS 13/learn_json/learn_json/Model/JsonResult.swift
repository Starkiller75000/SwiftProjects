//
//  JsonResult.swift
//  learn_json
//
//  Created by Benoît Bouton on 24/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

struct JsonResult: Decodable {
    var results: [User]
}

struct User: Decodable {
    var gender: String
    var email: String
    var age: Int
    var nat: String
    var name: Name
    var location: Adress
    var picture: Picture
}

struct Name: Decodable {
    var title: String
    var first: String
    var last: String
}

struct Adress: Decodable {
    var street: String
    var city: String
    var state: String
    var postcode: Int
    var coordinates: Coordinates
}

struct Coordinates: Decodable {
    var latitude: String
    var longitude: String
}

struct Picture: Decodable {
    var large: String
    var medium: String
    var thumbnail: String
}
