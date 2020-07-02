//
//  MyCollectionController.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyCollectionController: UICollectionViewController {
    
    var continents: [Continent] = CountryGetter().getContinents()
    var countrySelected: Country?

    override func viewDidLoad() {
        super.viewDidLoad()
        /*let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumLineSpacing = 45
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .horizontal*/
        collectionView.collectionViewLayout = MyFlowLayout(size: CGSize(width: 150, height: 150), lineSpacing: 45, itemSpacing: 20, direction: .vertical, headerSize: CGSize(width: collectionView.frame.width, height: 75))
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CollecPush", let next = segue.destination as? DetailController {
            next.country = countrySelected
        }
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return continents.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return continents[section].countries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollecOne", for: indexPath) as? MyCollecCellOne {
            cell.country = continents[indexPath.section].countries[indexPath.item]
            return cell
        }
    
        return UICollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        countrySelected = continents[indexPath.section].countries[indexPath.item]
        performSegue(withIdentifier: "CollecPush", sender: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CollectionHeaderReusableView
            header.str = continents[indexPath.section].name
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
