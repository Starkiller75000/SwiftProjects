//
//  UserVM.swift
//  learn_json
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

struct UserVM {
    var fullName: String
    var mail: String
    var age: String
    var adress: String
    var imageUrl: String
    
    init(user: User) {
        self.fullName = (user.name.title + " " + user.name.first + " " + user.name.last).capitalized
        self.mail = "email: \(user.email)"
        self.adress = """
        Adress:
        \(user.location.street)
        \(user.location.city)
        \(user.location.postcode) \(user.location.state)
        """
        self.age = "Age: \(user.age)"
        self.imageUrl = user.picture.large
    }
}
