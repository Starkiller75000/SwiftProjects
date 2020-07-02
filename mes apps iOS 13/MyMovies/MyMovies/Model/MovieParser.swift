//
//  MovieParser.swift
//  MyMovies
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

class MovieParser {
    
    private let _key = "8016ebbeb6f7571c5b010c7c45e56fae"
    private let _baseUrl = "https://api.themoviedb.org/3/movie/"
    private let _lang = "?language=fr"
    var completion: (([Movie]) -> Void)?
    
    func get(cat: MovieCategory, completion: (([Movie]) -> Void)?) {
        self.completion = completion
        let urlString = _baseUrl + cat.rawValue + _lang + "&api_key=" + _key
        guard let url = URL(string: urlString) else { self.completion?([]); return }
        sessionUrl(url: url)
    }
    
    func sessionUrl(url: URL) {
        URLSession.shared.dataTask(with: url, completionHandler: sessionResponse).resume()
    }
    
    func sessionResponse(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        DispatchQueue.main.async {
            if let d = data {
                do {
                    let r = try JSONDecoder().decode(MovieResponse.self, from: d)
                    self.completion?(r.results)
                } catch {
                    print(error.localizedDescription)
                    self.completion?([])
                }
            }
            if let err = error {
                print(err.localizedDescription)
                self.completion?([])
            }
        }
    }
}
