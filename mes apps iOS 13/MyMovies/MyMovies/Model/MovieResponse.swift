//
//  MovieResponse.swift
//  MyMovies
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import Foundation

struct MovieResponse: Decodable {
    var page: Int
    var total_pages: Int
    var total_results: Int
    var results: [Movie]
}

struct Movie: Decodable {
    var poster_path: String?
    var adult: Bool
    var overview: String
    var release_date: String
    var genre_ids: [Int]
    var id: Int
    var original_title: String
    var original_language: String
    var title: String
    var backdrop_path: String?
    var popularity: Double
    var vote_count: Int
    var video: Bool
    var vote_average: Double
}
