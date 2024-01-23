//
//  UserPostGridView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/5/24.
//

import SwiftUI

struct UserPostGridView: View {
    
    let user: User
    let posts: [Post]
    var postsOfUser: [Post] {
        posts.filter { $0.creator.id == user.id }
    }
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1, content: {
            ForEach(postsOfUser) { post in
                Image(post.imageURL)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            }
        })
    }
}

#Preview {
    UserPostGridView(user: .mock[0], posts: Post.mock)
}
