//
//  ViewController.swift
//  Les Dates
//
//  Created by Benoît Bouton on 16/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Obtenir une String au format de votre choix
    @IBOutlet weak var dateStringLbl: UILabel!
    
    //Time Interval (un peu de recherche)
    @IBOutlet weak var timeIntervalLbl: UILabel!
    
    //Si aujourd'hui, demain, hier, week-end
    @IBOutlet weak var calendarLbl: UILabel!
    
    //Il y a + mois, jours, heures
    @IBOutlet weak var ilyaLbl: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let format = "EEEE dd MMMM yy - HH:mm:ss - zzzz"
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dateChoisi(_ sender: UIDatePicker) {
        let date = sender.date
        dateStringLbl.text = date.stringWithFormat(format)
        timeIntervalLbl.text = date.timeStamp()
        calendarLbl.text = date.calendarStr()
        ilyaLbl.text = date.components()
    }
}

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: self)
    }
    
    func stringWithFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "es_ES")
        return formatter.string(from: self)
    }
    
    func timeStamp() -> String {
        let tempsEcoule = self.timeIntervalSinceNow
        return String(format: "%.2f", tempsEcoule)
    }
    
    func calendarStr() -> String {
        var str = ""
        let calendar = Calendar.current
        
        if calendar.isDateInToday(self) {
            str += "Aujourd'hui "
        }
        if calendar.isDateInYesterday(self) {
            str += "Hier "
        }
        if calendar.isDateInTomorrow(self) {
            str += "Demain "
        }
        if calendar.isDateInWeekend(self) {
            str += "Nous sommes le week-end "
        }
        return str
    }
    
    func components() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day, .hour, .minute], from: self, to: Date())
        let month = components.month ?? 0
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        return "Temps écoulé -> mois: \(month), jour(s): \(day), heure(s): \(hour), minute(s): \(minute)"
    }
}
