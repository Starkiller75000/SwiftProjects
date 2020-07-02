//
//  CollectionCell.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class CollectionCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var datas: [WeatherData] = []
    
    func setup(_ datas: [WeatherData]) {
        self.datas = datas
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 125, height: 175)
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SquareCell", for: indexPath) as! SquareCell
        cell.setupCell(datas[indexPath.item])
        return cell
    }
}
