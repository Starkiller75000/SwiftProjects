//
//  DataByDay.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

class DataByDay {
    var name: String
    var array: [WeatherData]
    
    init(_ name: String) {
        self.name = name
        self.array = []
    }
    
    func updateArray(_ data: WeatherData) {
        self.array.append(data)
    }
}
