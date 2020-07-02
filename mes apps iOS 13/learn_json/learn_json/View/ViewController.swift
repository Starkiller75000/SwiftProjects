//
//  ViewController.swift
//  learn_json
//
//  Created by Benoît Bouton on 24/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var profileIV: CircleIV!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var ageLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var adressLbl: UILabel!
    
    //var users: [User] = []
    //var user: User?
    
    var usersVM = [UserVM]()
    var userVM: UserVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Obtenir fichier json
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 45
        collectionView.collectionViewLayout = layout
        JSonFormatter().parse(fileName: "two", ext: "json") { (users) in
            self.usersVM = users.map({return UserVM(user: $0)})
            //self.users = users
            self.collectionView.reloadData()
            //self.user = self.users.first
            self.userVM = self.usersVM.first
            self.setupUser()
        }
    }
    
    func setupUser() {
        //guard let selectedUser = user else { return }
        guard let selectedUser = userVM else { return }
        nameLbl.text = selectedUser.fullName
        emailLbl.text = selectedUser.mail
        ageLbl.text = selectedUser.age
        adressLbl.text = selectedUser.adress
        profileIV.loadFrom(selectedUser.imageUrl)
        /*let name = selectedUser.name
        let nameStr = name.title + " " + name.first + " " + name.last
        nameLbl.text = nameStr
        emailLbl.text = "mail: " + selectedUser.email
        ageLbl.text = "Age: \(selectedUser.age)"
        let adress = selectedUser.location
        var adressStr = "Adresse: \n"
        adressStr += adress.street + "\n"
        adressStr += adress.city + "\n"
        adressStr += String(adress.postcode) + ", " + adress.state
        adressLbl.text = adressStr
        profileIV.loadFrom(selectedUser.picture.large)*/
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersVM.count
        //return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let user = users[indexPath.item]
        let user = usersVM[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
        cell.urlString = user.imageUrl
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.userVM = usersVM[indexPath.item]
        setupUser()
    }
}
