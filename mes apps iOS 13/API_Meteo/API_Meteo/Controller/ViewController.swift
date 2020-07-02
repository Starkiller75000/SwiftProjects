//
//  ViewController.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 24/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var tempIcon: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var manager = CLLocationManager()
    var resultWeather: JSONResult?
    var days: [DataByDay] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func updateUI() {
        days = []
        guard let new = resultWeather else { return }
        cityName.text = new.city_name
        guard let first = new.data.first else { return }
        tempLabel.text = "\(first.temp)°C"
        tempIcon.loadIcon(first.weather.icon)
        descLabel.text = first.weather.description
        new.data.forEach { (weatherData) in
            let day = DateHelper().toDay(weatherData.ts)
            if let existing = days.filter({$0.name == day}).first {
                existing.updateArray(weatherData)
            } else {
                let new = DataByDay(day)
                new.updateArray(weatherData)
                days.append(new)
            }
        }
        tableView.reloadData()
    }
}

