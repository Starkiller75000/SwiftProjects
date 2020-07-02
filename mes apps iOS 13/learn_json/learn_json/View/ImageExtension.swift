//
//  ImageExtension.swift
//  learn_json
//
//  Created by Benoît Bouton on 24/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadFrom(_ urlString: String) {
        //Vérifie si cette string est une url
        guard let url = URL(string: urlString) else {
            return
        }
        //Lancement URLSession
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //Vérifier si erreur
            if let err = error {
                print(err.localizedDescription)
            }
            //Vérifier si data
            if let d = data {
                //Convertir data en image
                let image = UIImage(data: d)
                //Revenir sur le main
                DispatchQueue.main.async {
                    //Attribuer l'image
                    self.image = image
                }
            }
        }.resume()
    }
}
