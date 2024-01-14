//
//  ProfileHeaderView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/5/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State var showEditProfile: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            /// pic and stats
            HStack {
                CircularProfileImageView(user: user)
                Spacer()
                HStack(spacing: 16) {
                    UserStatView(title: "Posts", value: 3)
                    UserStatView(title: "Followers", value: 12)
                    UserStatView(title: "Following", value: 30)
                }
                .padding(16)
            }.padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                Text(user.userName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(user.fullName.orEmpty)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(user.bio.orEmpty)
                    .font(.footnote)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            
            Button(action: {
                showEditProfile.toggle()
            }, label: {
                if user.isCurrentUser {
                    ProfileEditButton()
                } else {
                    ProfileFollowButton()
                }
            })

            
            Divider()
        }
        .fullScreenCover(
            isPresented: $showEditProfile,
            onDismiss: {
                
            }, content: {
                let viewModel = ProfileEditViewModel(user: user)
                ProfileEditView(viewModel: viewModel)
            })
    }
}

#Preview {
    ProfileHeaderView(user: .mock[0])
}
