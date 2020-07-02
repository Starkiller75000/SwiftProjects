//
//  ViewController.swift
//  Disney
//
//  Created by Benoît Bouton on 10/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var genderButtons: [UIButton]!
    @IBOutlet var placeButtons: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let radius: CGFloat = 15
    var selectedGender = 0
    var selectedPlace = 0
    
    let males = ["mowgli", "kuzco", "aladdin"]
    let females = ["pocahontas", "raiponce", "esmeralda"]
    let animals = ["timon", "la bete", "remi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        titleLabel.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(reset))
        titleLabel.addGestureRecognizer(tap)
    }
    
    func setupUI() {
        resultLabel.clipsToBounds = true
        resultLabel.layer.cornerRadius = radius
        setupButtonsCollection(genderButtons, selectedGender)
        setupButtonsCollection(placeButtons, selectedPlace)
    }
    
    func setupButtonsCollection(_ array: [UIButton], _ index: Int) {
        for x in 0..<array.count {
            array[x].layer.cornerRadius = radius
            if index == x + 1 {
                array[x].backgroundColor = .systemTeal
            } else {
            array[x].backgroundColor = .lightGray
            }
        }
    }
    
    func getStringFromArray() -> String {
        switch selectedGender {
        case 1:
            return males[selectedPlace - 1]
        case 2:
            return females[selectedPlace - 1]
        default:
            return animals[selectedPlace - 1]
        }
    }
    
    @objc func reset() {
        selectedPlace = 0
        selectedGender = 0
        resultLabel.text = ""
        imageView.image = nil
        setupUI()
    }
    
    @IBAction func getResult(_ sender: Any) {
        if selectedGender != 0 && selectedPlace != 0 {
            resultLabel.text = "Vous êtes: " + getStringFromArray().capitalized
            imageView.image = UIImage(named: getStringFromArray())
        } else {
            resultLabel.text = "Veuillez choisir des valeurs pour continuer"
        }
    }
    
    @IBAction func genderPressed(_ sender: UIButton) {
        selectedGender = sender.tag
        setupButtonsCollection(genderButtons, selectedGender)
    }
    
    @IBAction func placePressed(_ sender: UIButton) {
        selectedPlace = sender.tag
        setupButtonsCollection(placeButtons, selectedPlace)
    }
    
}

