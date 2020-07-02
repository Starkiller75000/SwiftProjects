//
//  JsonFormatter.swift
//  learn_json
//
//  Created by Benoît Bouton on 24/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

class JSonFormatter {
    func parse(fileName: String, ext: String, completion: (([User]) -> Void)?) {
        if let file = Bundle.main.url(forResource: fileName, withExtension: ext) {
            //Convertir en type Data
            do {
                let jsonData = try Data(contentsOf: file)
                //Convertir data en User
                //1. Avec fichier one
                //let user = try JSONDecoder().decode(User.self, from: jsonData)
                //print(user.email)
                //2. Avec le fichier three
                //let users = try JSONDecoder().decode([User].self, from: jsonData)
                //print(users.count)
                //3. Avec le fichier two
                let results = try JSONDecoder().decode(JsonResult.self, from: jsonData)
                /*print(results.results.count)
                let users = results.results
                for user in users {
                    print(user.name.first)
                }*/
                completion?(results.results)
            } catch {
                print(error.localizedDescription)
                completion?([])
            }
        } else {
            print("Ne peux pas récupérer Json depuis le fichier")
            completion?([])
        }
    }
}
