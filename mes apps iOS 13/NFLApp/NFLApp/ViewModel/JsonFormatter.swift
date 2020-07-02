//
//  JsonFormatter.swift
//  NFLApp
//
//  Created by Benoît Bouton on 24/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

class JsonFormatter {
    func parse(completion: (([Team]) -> Void)?) {
        if let file = Bundle.main.url(forResource: "nfl", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: file)
                let results = try JSONDecoder().decode([Team].self, from: jsonData)
                completion?(results)
            } catch {
                print(error.localizedDescription)
                completion?([])
            }
        } else {
            completion?([])
        }
    }
}
