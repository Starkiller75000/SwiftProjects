//
//  CategoryCell.swift
//  MyMovies
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []
    var controller: ViewController!
    
    func setup(_ movies: [Movie], _ controller: ViewController) {
        self.controller = controller
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.movies = movies
        self.collectionView.reloadData()
        self.collectionView.collectionViewLayout = setLayout()
    }
    
    func setLayout() -> UICollectionViewFlowLayout {
        let l = UICollectionViewFlowLayout()
        l.itemSize = CGSize(width: 185, height: 250)
        l.minimumLineSpacing = 30
        l.scrollDirection = .horizontal
        return l
    }
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Movie", for: indexPath) as! MovieCell
        cell.setup(movies[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.item]
        controller.performSegue(withIdentifier: "Detail", sender: movie)
    }
}
