//
//  SquareCell.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class SquareCell: UICollectionViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    var data: WeatherData!
    
    func setupCell(_ data: WeatherData) {
        self.data = data
        timeLabel.text = DateHelper().toHour(self.data.ts)
        icon.loadIcon(self.data.weather.icon)
        tempLabel.text = "\(self.data.temp)°C"
        descLabel.text = self.data.weather.description
    }
    
}
