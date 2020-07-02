//
//  ExtensionUIImageView.swift
//  API_Meteo
//
//  Created by Benoît Bouton on 25/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadIcon(_ icon: String) {
        let urlString = "https://www.weatherbit.io/static/img/icons/\(icon).png"
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (d, _, _) in
            DispatchQueue.main.async {
                guard d != nil else { return }
                let image = UIImage(data: d!)
                self.image = image
            }
        }.resume()
    }
}
