//
//  ViewController.swift
//  NFLApp
//
//  Created by Benoît Bouton on 22/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nfl_logo: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var allTeams: [TeamVM] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setupGradient([UIColor.white.cgColor, nflblue.cgColor])
        nfl_logo.circleView(nfl_logo.frame.width / 2)
        nfl_logo.shadow()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        let width = collectionView.frame.width / 2 - 20
        let height = width + 30
        layout.itemSize = CGSize(width: width, height: height)
        collectionView.collectionViewLayout = layout
        JsonFormatter().parse() { (teams) in
            self.allTeams = teams.map({return TeamVM(team: $0)})
            self.collectionView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail", let next = segue.destination as? DetailController {
            next.team = sender as? TeamVM
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allTeams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCell
        cell.setupCell(allTeams[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detail", sender: allTeams[indexPath.item])
    }
}
