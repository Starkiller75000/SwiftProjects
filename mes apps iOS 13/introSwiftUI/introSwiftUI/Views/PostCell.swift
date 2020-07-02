//
//  PostCell.swift
//  introSwiftUI
//
//  Created by Benoît Bouton on 02/07/2020.
//  Copyright © 2020 Benoît Bouton. All rights reserved.
//

import SwiftUI

struct PostCell: View {
    @Binding var post: Post
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 10) {
                RoundedImage(url: post.user.imageUrl, size: 45)
                NameView(name: post.user.surname)
                NameView(name: post.user.name)
            }
            Image(post.imageUrl)
            .resizable()
                .aspectRatio(contentMode: .fit)
            Text(post.text)
            Divider().padding()
            HStack(spacing: 20) {
                Image(systemName: "message")
                Button(action: {
                    self.post.isLike = !self.post.isLike
                }) {
                    Image(systemName: (self.post.isLike) ? "heart.fill" : "heart")
                }
                Spacer()
                Image(systemName: "paperplane")
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: .constant(Post(imageUrl: "ski", text: "Pas si mal après tout la garde de nuit.", isLike: false, user: Getter().jon))).previewLayout(.sizeThatFits)
    }
}
