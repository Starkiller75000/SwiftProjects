//
//  ContentView.swift
//  introSwiftUI
//
//  Created by Benoît Bouton on 01/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var texte = "Salut les codeurs! Comment allez vous aujourd'hui?"
    //var array = ["Pomme", "Poire", "Banane"]
    @State var postArrays = Getter().posts
    @State var buttonColor = Color.green
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Getter().users, id: \.id) { user in
                            RoundedImage(url: user.imageUrl, size: 80)
                        }
                    }
                }
                List(postArrays.indices) { index in
                    PostCell(post: self.$postArrays[index])
                }
            }
            
            .navigationBarTitle("InstaBee")
                .navigationBarItems(trailing: RoundedImage(url: "bob", size: 60))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewDevice("iPhone 7")
            ContentView().previewDevice("iPhone XR")
            ContentView().previewLayout(.sizeThatFits)
            ContentView().environment(\.colorScheme, .dark)
        }
    }
}
