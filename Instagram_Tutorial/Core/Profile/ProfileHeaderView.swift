//
//  ProfileHeaderView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/5/24.
//

import SwiftUI

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

#Preview {
    ProfileHeaderView(user: .mock[0])
}
