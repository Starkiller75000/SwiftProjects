//
//  GodsController.swift
//  GreekGodsApp
//
//  Created by Benoît Bouton on 19/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class GodsController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var gods: [God] = GodGetter().getGods()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail", let next = segue.destination as? DetailController {
            next.god = sender as? God
        }
    }
}

extension GodsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let god = gods[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GodCell") as? GodCell {
            cell.setupCell(god)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: gods[indexPath.row])
    }
}
