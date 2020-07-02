//
//  RoundedImage.swift
//  introSwiftUI
//
//  Created by Benoît Bouton on 02/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import SwiftUI

struct RoundedImage: View {
    var url: String
    var size: CGFloat
    var body: some View {
        Image(url)
        .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size, height: size, alignment: .center)
        .clipped()
        .cornerRadius(size / 2)
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url: "jon", size: 80).previewLayout(.sizeThatFits)
    }
}
