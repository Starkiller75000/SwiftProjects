//
//  ExtensionTableView.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return days[section].array.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let new = days[indexPath.section].array[indexPath.row]
        if indexPath.section == 0, let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCell") as? CollectionCell {
            cell.setup(days[indexPath.section].array)
            return cell
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell {
                cell.data = new
                return cell
            }
        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.detailTextLabel?.text = new.weather.description
        cell.textLabel?.text = String(new.temp)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return days[section].name
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 250 : 100
    }
}
