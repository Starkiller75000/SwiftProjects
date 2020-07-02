//
//  DateHelper.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class DateHelper {
    
    var formatter = DateFormatter()
    
    func fromTimestamp(_ int: Int) -> Date {
        return Date(timeIntervalSince1970: Double(int))
    }
    
    func toDay(_ int: Int) -> String {
        let date = fromTimestamp(int)
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    func toHour(_ int: Int) -> String {
        let date = fromTimestamp(int)
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}
