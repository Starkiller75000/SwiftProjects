//
//  MyCustomViewController.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 18/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class MyCustomViewController: UIViewController {
    //1.
    @IBOutlet weak var tableView: MyTableView!
    
    var countries: [Country] = CountryGetter().getAllCountries()
    let control = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //2.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = control
        control.attributedTitle = NSAttributedString(string: "Chargement des données")
        control.tintColor = .red
        control.addTarget(self, action: #selector(reload), for: .valueChanged)
    }
    
    @objc func reload() {
        countries = CountryGetter().getAllCountries()
        tableView.reloadData()
        control.endRefreshing()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pop", let next = segue.destination as? DetailController {
            next.country = sender as? Country
        }
    }
}

//3.
extension MyCustomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellTwo") as? CellTwo {
            cell.setupCell(countries[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "pop", sender: countries[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            countries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}
