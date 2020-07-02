//
//  ViewController.swift
//  Ma première app
//
//  Created by Benoît Bouton on 23/04/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var littleButtons: [UIButton]!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    var couleur: [UIColor] = [.white, .systemTeal, .systemGray]
    var position: CGPoint?
    var frame: CGRect?
    
    override func viewWillLayoutSubviews() {
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Ajouter des interactions (gestures)
        let tap = UITapGestureRecognizer(target: self, action: #selector(holderViewTapped))
        tap.numberOfTapsRequired = 2
        //let long = UILongPressGestureRecognizer(target: self, action: #selector(holderViewTapped))
        holderView.addGestureRecognizer(tap)
        
        holderView.backgroundColor = UIColor.white
        buttonA.backgroundColor = .red
        buttonA.tintColor = .white
        buttonB.tintColor = .white
        //buttonB.backgroundColor = UIColor.lightGray
        //buttonB.setTitle("Button B", for: .normal)
        //buttonB.setImage(UIImage(systemName: "house.fill"), for: .normal)
        for index in 0..<littleButtons.count {
            littleButtons[index].setTitle("", for: .normal)
            littleButtons[index].backgroundColor = couleur[index]
            littleButtons[index].layer.cornerRadius = littleButtons[index].frame.width / 2
            //littleButtons[index].layer.borderWidth = 2
            //littleButtons[index].layer.borderColor = UIColor.red.cgColor
        }
        buttonA.layer.cornerRadius = 20
        buttonB.layer.cornerRadius = 20
        //textLabel.text = "J'ai changé de texte"
        //textLabel.textColor = .red
        //textLabel.font = UIFont.systemFont(ofSize: 20 , weight: .heavy)
        //textLabel.font = UIFont(name: "Chalkduster", size: 30)
        holderView.layer.cornerRadius = 20
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 2
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                frame = profileImageView.frame
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                //Déplacer la vue
                let touchPosition = first.preciseLocation(in: self.view)
                profileImageView.center = touchPosition
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                if frame != nil {
                    profileImageView.frame = frame!
                }
            }
        }
    }
    
    @objc func holderViewTapped() {
        textLabel.isHidden = !textLabel.isHidden
    }

    @IBAction func buttonAPressed(_ sender: UIButton) {
        textLabel.textColor = .red
    }
    @IBAction func buttonBPressed(_ sender: Any) {
        textLabel.textColor = .green
    }
    
    @IBAction func littleButtonsPressed(_ sender: UIButton) {
        holderView.backgroundColor = couleur[sender.tag]
    }
    
    
}

