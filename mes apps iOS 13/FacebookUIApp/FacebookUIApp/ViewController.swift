//
//  ViewController.swift
//  FacebookUIApp
//
//  Created by Benoît Bouton on 24/04/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coverIV: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var storyBtn: UIButton!
    @IBOutlet var squareBtns: [UIButton]!
    
    var center: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storyBtn.layer.cornerRadius = 15
        for button in squareBtns {
            button.layer.cornerRadius = 15
        }
        profileImageView.layer.cornerRadius = 75
        profileImageView.layer.borderColor = UIColor.systemBackground.cgColor
        profileImageView.layer.borderWidth = 4
        
        coverIV.isUserInteractionEnabled = true
        coverIV.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gesture)))
    }
    
    //Touches
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                center = profileImageView.center
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                profileImageView.center = first.preciseLocation(in: self.view)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let first = touches.first {
            if first.view == profileImageView {
                if center != nil {
                    profileImageView.center = center!
                }
            }
        }
    }

    //Gesture
    @objc func gesture() {
        UIView.animate(withDuration: 1) {
            if self.profileImageView.layer.cornerRadius == 0 {
                self.profileImageView.layer.cornerRadius = 75
            } else {
            self.profileImageView.layer.cornerRadius = 0
            }
        }
    }
    
    //Simple
    @IBAction func storyButtonPressed(_ sender: Any) {
        storyBtn.backgroundColor = UIColor.systemTeal
    }
    
    //Multiple
    @IBAction func squareButtons(_ sender: UIButton) {
        coverIV.alpha = CGFloat(sender.tag)
    }
    
}

