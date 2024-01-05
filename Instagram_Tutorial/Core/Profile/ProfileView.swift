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

struct ProfileHeaderView: View {
    
    let user: User
    
    var body: some View {
        VStack(spacing: 10) {
            /// pic and stats
            HStack {
                Image(.eddyDesc)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Spacer()
                HStack(spacing: 16) {
                    UserStatView(title: "Posts", value: 3)
                    UserStatView(title: "Followers", value: 12)
                    UserStatView(title: "Following", value: 30)
                }
                .padding(16)
            }
            
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                Text("Bumgeun Song")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text("love writing / programming")
                    .font(.footnote)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            Button(action: {
                
            }, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .overlay(alignment: .center) {
                        RoundedRectangle(
                            cornerSize: CGSize(
                                width: 6,
                                height: 6
                            ),
                            style: .circular
                        ).stroke(.gray)
                    }
            })
            
            Divider()
        }
    }
}

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
