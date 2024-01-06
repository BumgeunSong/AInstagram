//
//  ProfileView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/29/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    let posts: [Post] = Post.mock
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                UserPostGridView(user: user, posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    })
                }
            })
        }
    }
}

#Preview {
    ProfileView(user: .mock[0])
}
