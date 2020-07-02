import UIKit

//Date Actuelle
let date = Date()

//Custom
//TimeInterval: nombre de secondes passées depuis une date

let minute: TimeInterval = 60
let heure: TimeInterval = minute * 60
let jour: TimeInterval = heure * 24

let dateInterval = Date(timeIntervalSinceNow: jour)
let hier = Date(timeIntervalSinceNow: -jour)

let soixnteDix = Date(timeIntervalSince1970: jour * 365)
let autreDate = Date(timeIntervalSinceReferenceDate: jour * 2)

let depuisDate = Date(timeInterval: -heure * 4, since: hier)

func convertirDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = DateFormatter.Style.full
    dateFormatter.timeStyle = .medium
    dateFormatter.locale = Locale(identifier: "es_ES")
    
    return dateFormatter.string(from: date)
}

func convertirString(string: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = "E, dd MMM yyyy HH:mm:ss"
    formatter.locale = Locale(identifier: "fr_FR")
    
    if let date = formatter.date(from: string) {
        return date
    }
    return nil
}

let str = convertirDate(date: hier)
let dateStr = convertirString(string: "mer., 12 sept 2014 14:12:00")

//Calendar

let calendar = Calendar.current

func calendarStr(date: Date) -> String {
    if calendar.isDateInToday(date) {
        return "Ajourd'hui"
    }
    if calendar.isDateInYesterday(date) {
        return "Hier"
    }
    if calendar.isDateInTomorrow(date) {
        return "Demain"
    }
    if calendar.isDateInWeekend(date) {
        return "Tous dehors c'est le week-end"
    }
    
    return "La réponse D"
}

let calStr = calendarStr(date: dateInterval)

func composants(from: Date) {
    let components = calendar.dateComponents([.month, .day, .hour, .minute], from: from, to: Date())
    print(components.month)
    print(components.day)
    print(components.hour)
    print(components.minute)
}

composants(from: Date(timeIntervalSinceNow: ((jour * 12) + (heure * 3) + (minute * 25))))
