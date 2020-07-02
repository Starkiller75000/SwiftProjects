//
//  NameView.swift
//  introSwiftUI
//
//  Created by Benoît Bouton on 02/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import SwiftUI

struct NameView: View {
    var name: String
    var body: some View {
        Text(name).font(.headline).foregroundColor(.blue)
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(name: "Matthieu").previewLayout(.sizeThatFits)
    }
}
