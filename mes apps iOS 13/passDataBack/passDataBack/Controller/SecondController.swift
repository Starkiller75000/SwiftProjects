//
//  SecondController.swift
//  passDataBack
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class SecondController: UITableViewController {
    
    var delegate: ColorDelegate?
    
    var colors: [Couleur] = [
        Couleur(name: "Jaune", color: .systemYellow),
        Couleur(name: "Violet", color: .systemPurple),
        Couleur(name: "Teal", color: .systemTeal),
        Couleur(name: "Rose", color: .systemPink),
        Couleur(name: "Orange", color: .systemOrange)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? Cell {
            cell.color = colors[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choix des couleurs"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.passColorBack(colors[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
}
