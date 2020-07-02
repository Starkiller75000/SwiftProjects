//
//  Country.swift
//  CountriesApp
//
//  Created by Benoît Bouton on 18/06/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import UIKit

class Country {
    private var _name: String
    private var _capital: String
    private var _countryCode: String
    
    var name: String {
        return _name
    }
    
    var capital: String {
        return _capital
    }
    
    var flag: UIImage? {
        return UIImage(named: _countryCode)
    }
    
    init(name: String, capital: String, code: String) {
        self._name = name
        self._capital = capital
        self._countryCode = code
    }
}
