//
//  JSONResult.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

struct JSONResult: Decodable {
    var data: [WeatherData]
    var city_name: String
    var lat: Double
    var lon: Double
    var timezone: String
    var country_code: String
    var state_code: String
}

struct WeatherData: Decodable {
    var wind_cdir: String
    var rh: Double
    var pod: String
    var timestamp_utc: String
    var pres: Double
    var solar_rad: Double
    var ozone: Double
    var wind_gust_spd: Double
    var timestamp_local: String
    var snow_depth: Int
    var clouds: Int
    var ts: Int
    var wind_spd: Double
    var pop: Int
    var wind_cdir_full: String
    var slp: Double
    var dni: Double
    var dewpt: Double
    var snow: Int
    var uv: Double
    var wind_dir: Int
    var clouds_hi: Int
    var precip: Double
    var vis: Double
    var dhi: Double
    var app_temp: Double
    var datetime: String
    var temp: Double
    var ghi: Double
    var clouds_mid: Double
    var clouds_low: Double
    var weather: Weather
}

struct Weather: Decodable {
    var icon: String
    var code: Int
    var description: String
}
