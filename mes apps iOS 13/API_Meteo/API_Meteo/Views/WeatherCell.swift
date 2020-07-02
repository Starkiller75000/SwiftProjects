//
//  WeatherCell.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var data: WeatherData! {
        didSet {
            icon.loadIcon(data.weather.icon)
            hourLbl.text = DateHelper().toHour(data.ts)
            tempLbl.text = "\(data.temp)°C"
            descLbl.text = data.weather.description
        }
    }

}
