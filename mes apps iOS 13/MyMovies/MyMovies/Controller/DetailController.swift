//
//  DetailController.swift
//  MyMovies
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var originalLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var holder: UIView!
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let m = movie else {
            return
        }
        titleLabel.text = m.title
        overviewLabel.text = m.overview
        poster.load(185, m.poster_path!)
        print(m.original_title)
        dateLabel.text = "Sorti le: \(m.release_date)"
        originalLabel.text = "Titre original: \n\(m.original_title)"
        ratingLabel.text = "Note du public: \(m.vote_average)"
        bg.load(500, m.poster_path!)
        holder.layer.cornerRadius = 10
    }
}
