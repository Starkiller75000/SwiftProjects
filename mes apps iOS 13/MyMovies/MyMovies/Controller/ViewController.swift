//
//  ViewController.swift
//  MyMovies
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var moviesByCategory: [MovieByCategory] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        MovieCategory.allCases.forEach { (cat) in
            let new = MovieByCategory(cat: cat)
            self.moviesByCategory.append(new)
        }
        
        moviesByCategory.forEach { (mbc) in
            MovieParser().get(cat: mbc.cat) { (movies) in
                mbc.movies = movies
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Detail", let detail = segue.destination as? DetailController {
            detail.movie = sender as? Movie
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return moviesByCategory.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movies = moviesByCategory[indexPath.section].movies
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Category") as? CategoryCell {
            cell.setup(movies, self)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 275
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return moviesByCategory[section].name
    }
}

