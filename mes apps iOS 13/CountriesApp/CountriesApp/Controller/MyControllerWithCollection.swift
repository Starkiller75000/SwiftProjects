//
//  MyControllerWithCollection.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class MyControllerWithCollection: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var countries: [Country] = CountryGetter().getAllCountries()
    var selectedCountries: [Country] = []
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let width = collectionView.frame.width / 3 - 30
        collectionView.collectionViewLayout = MyFlowLayout(size: CGSize(width: width, height: width), lineSpacing: 20, itemSpacing: 10, direction: .vertical, headerSize: nil)
        searchBar.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CollecPop", let next = segue.destination as? DetailController {
            next.country = sender as? Country
        }
    }
}

extension MyControllerWithCollection: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isSearching ? selectedCountries.count : countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollecTwo", for: indexPath) as? MyCollecCellTwo {
            let country = isSearching ? selectedCountries[indexPath.item] : countries[indexPath.item]
            cell.setupCell(country: country)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let country = isSearching ? selectedCountries[indexPath.item] : countries[indexPath.item]
        performSegue(withIdentifier: "CollecPop", sender: country)
    }
}

extension MyControllerWithCollection: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        collectionView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            isSearching = false
            collectionView.reloadData()
        } else {
            isSearching = true
            selectedCountries = countries.filter({$0.name.lowercased().contains(searchText.lowercased())})
            collectionView.reloadData()
        }
    }
}
