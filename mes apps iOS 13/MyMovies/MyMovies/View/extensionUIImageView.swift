//
//  extensionUIImageView.swift
//  MyMovies
//
//  Created by Benoît Bouton on 26/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(_ size: Int, _ path: String) {
        let urlString = "http://image.tmdb.org/t/p/" + "w\(size)//" + path
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { (d, _, _) in
            DispatchQueue.main.async {
                if let data = d {
                    self.image = UIImage(data: data)
                }
            }
        }.resume()
    }
}
