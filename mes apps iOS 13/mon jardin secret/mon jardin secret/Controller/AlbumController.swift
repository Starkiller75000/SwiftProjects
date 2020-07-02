//
//  AlbumController.swift
//  mon jardin secret
//
//  Created by Benoît Bouton on 29/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class AlbumController: UITableViewController {
    
    var album: Album?
    var elements: [Element] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard album != nil else { return }
        CoreDataHelper().allElementsFrom(album: album!) { (e) in
            self.elements = e
            self.tableView.reloadData()
            print(self.elements.count)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "element") as! ElementCell
        cell.element = elements[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItem", let next = segue.destination as? AddController {
            next.album = album
        }
    }

    @IBAction func addItem(_ sender: Any) {
        performSegue(withIdentifier: "addItem", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataHelper().deleteElement(elements[indexPath.row]) { (errString) in
                if errString != nil {
                    AlertHelper().errorAlert(errString!, self)
                } else {
                    self.elements.remove(at: indexPath.row)
                    self.tableView.deleteRows(at: [indexPath], with: .fade)
                }
            }
        }
    }
}
