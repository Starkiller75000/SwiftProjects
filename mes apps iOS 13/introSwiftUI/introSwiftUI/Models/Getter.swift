//
//  Getter.swift
//  introSwiftUI
//
//  Created by Benoît Bouton on 02/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

class Getter {
    let bob = User(name: "L'Eponge", surname: "Bob", imageUrl: "bob")
    let dwayne = User(name: "Johnson", surname: "Dwayne", imageUrl: "dwayne")
    let gilfoyle = User(name: "Gilfoyle", surname: "Bertand", imageUrl: "gilfoyle")
    let jon = User(name: "Snow", surname: "Jon", imageUrl: "jon")
    let julie = User(name: "Ertz", surname: "Julie", imageUrl: "julie")
    let mila = User(name: "Kunis", surname: "Mila", imageUrl: "mila")
    let richard = User(name: "Sherman", surname: "Richard", imageUrl: "richard")
    let sheldon = User(name: "Cooper", surname: "Sheldon", imageUrl: "sheldon")
 
    var users: [User] {
        return [bob, dwayne, gilfoyle, jon, julie, mila, richard, sheldon]
    }
 
    var posts: [Post] {
    return [
        Post(imageUrl: "caraibes", text: "Home sweet home", isLike: true, user: bob),
        Post(imageUrl: "grumpy", text: "Ma tête avant d'avoir bu au moins 2 tasses de café....\nOu après avoir croisé Dinesh", isLike: false, user: gilfoyle),
        Post(imageUrl: "moon_break", text: "Quest for 6\n Prochaine destination la Lune", isLike: true, user: richard),
        Post(imageUrl: "nyc", text: "Ce soir, finale du championnat en direct de la grosse pomme #ChicagoVSNewYorkCity", isLike: false, user: julie),
        Post(imageUrl: "puppy", text: "Je craque pour ce chien", isLike: false, user: mila),
        Post(imageUrl: "ski", text: "Pas si mal après tout la garde de nuit.", isLike: false, user: jon)]
    }
}
