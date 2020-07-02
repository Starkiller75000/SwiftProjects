//
//  MovieByCategory.swift
//  MyMovies
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

class MovieByCategory {
    var name: String
    var cat: MovieCategory
    var movies: [Movie]
    
    init(cat: MovieCategory) {
        self.cat = cat
        self.movies = []
        switch self.cat {
        case .now_playing:
            self.name = "À l'affiche"
        case .popular:
            self.name = "Populaire"
        case .top_rated:
            self.name = "Mieux notés"
        case .upcoming:
            self.name = "À venir"
        }
    }
}
