//
//  HomeController.swift
//  mon jardin secret
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit
import LocalAuthentication

class HomeController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var identificationBtn: UIButton!
    
    var albums: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(hide), name: UIApplication.didEnterBackgroundNotification, object: nil)
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        allAlbums()
    }
    
    func resetTF() {
        view.endEditing(true)
        textField.text = nil
        textField.placeholder = "Nouvel Album"
    }
    
    func allAlbums() {
        resetTF()
        CoreDataHelper().getAlbums { (albums, err) in
            self.albums = albums
            self.tableView.reloadData()
            if err != nil {
                AlertHelper().errorAlert(err!, self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailAlbum", let next = segue.destination as? AlbumController {
            next.album = sender as? Album
        }
    }
    
    @objc func hide() {
        showAuth(true)
    }
    
    func showAuth(_ bool: Bool) {
        let alpha: CGFloat = bool ? 1 : 0
        UIView.animate(withDuration: 1) {
            self.blur.alpha = alpha
            self.identificationBtn.alpha = alpha
        }
    }
    
    @IBAction func idBtnPressed(_ sender: Any) {
        AuthHelper().startAuth { (success, errString) in
            if success {
                self.showAuth(false)
            } else {
                if errString != nil {
                    AlertHelper().errorAlert(errString!, self)
                }
            }
        }
    }
    
    @IBAction func validateBtnPressed(_ sender: Any) {
        CoreDataHelper().addAlbum(textField.text) { (errStr) in
            if errStr != nil {
                AlertHelper().errorAlert(errStr!, self)
            } else {
                self.allAlbums()
            }
        }
    }
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let album = albums[indexPath.row]
        cell.textLabel?.text = album.name
        let int: Int = (albums[indexPath.row].elements?.allObjects.count) ?? 0
        cell.detailTextLabel?.text = "Elements: \(int)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let album = albums[indexPath.row]
            CoreDataHelper().deleteAlbum(album) { (errString) in
                if errString != nil {
                    AlertHelper().errorAlert(errString!, self)
                } else {
                    self.allAlbums()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailAlbum", sender: albums[indexPath.row])
    }
}

extension HomeController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resetTF()
        return true
    }
}
