//
//  TeamVM.swift
//  NFLApp
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

struct TeamVM {
    var fullName: String
    var logo: String
    var stadiumUrl: String
    var stadiumInfo: String
    var conf: UIImage?
    var champs: String
    
    typealias imageCompletion = (UIImage?) -> Void
    
    init(team: Team) {
        self.fullName = team.team.location + " " + team.team.name
        self.logo = team.team.logo
        self.stadiumUrl = team.stadium.image
        self.stadiumInfo = team.stadium.name + " Capacité: \(team.stadium.capacity) places."
         var champsStr = "\(team.titles.count) fois champions. "
         for title in team.titles {
             champsStr += "\(title), "
         }
        self.champs = champsStr
        self.conf = UIImage(named: team.conference.lowercased())
    }
    
    func image(completion: imageCompletion?) {
        if let url = URL(string: stadiumUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!.localizedDescription)
                    completion?(nil)
                }
                if data != nil {
                    DispatchQueue.main.async {
                        completion?(UIImage(data: data!))
                    }
                }
            }.resume()
        } else {
            completion?(nil)
        }
    }
}
