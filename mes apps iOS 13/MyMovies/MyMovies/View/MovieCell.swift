//
//  MovieCell.swift
//  MyMovies
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movie: Movie!
    
    func setup(_ movie: Movie) {
        self.movie = movie
        contentView.layer.cornerRadius = 10
        titleLabel.text = self.movie.title
        poster.load(185, self.movie.poster_path!)
    }
}
