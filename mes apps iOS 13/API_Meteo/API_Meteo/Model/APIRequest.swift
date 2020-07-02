//
//  APIRequest.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class APIRequest {
    
    var completion: ((_ result: JSONResult?, _ error: String?) -> Void)?
    var baseUrl = "https://api.weatherbit.io/v2.0/forecast/hourly"
    var apiKey = "ddea76809d9b4943a2090eac0a61a470"
    var lang = Locale.current.languageCode ?? "en"
    var units = "M"
    
    func start(_ lat: Double, _ lon: Double, completion: ((_ result: JSONResult?, _ error: String?) -> Void)?) {
        self.completion = completion
        let urlString = "\(baseUrl)?lat=\(lat)&lon=\(lon)&units=\(units)&lang=\(lang)&key=\(apiKey)"
        guard let url = URL(string: urlString) else { completion?(nil, "Mauvaise url"); return }
        URLSession.shared.dataTask(with: url, completionHandler: response).resume()
    }
    
    func response(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        DispatchQueue.main.async {
            if let d = data {
                do {
                    let result = try JSONDecoder().decode(JSONResult.self, from: d)
                    self.completion?(result, nil)
                } catch {
                    self.completion?(nil, error.localizedDescription)
                }
            } else {
                self.completion?(nil, error?.localizedDescription ?? "")
            }
        }
    }
}
