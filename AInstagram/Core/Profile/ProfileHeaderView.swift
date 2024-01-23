//
//  ProfileHeaderView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/5/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Binding var userToShowProfile: User
    @State var showEditProfile: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            /// pic and stats
            HStack {
                CircularProfileImageView(user: userToShowProfile, size: 80)
                Spacer()
                HStack(spacing: 16) {
                    UserStatView(title: "포스트", value: 3)
                    UserStatView(title: "팔로워", value: 12)
                    UserStatView(title: "팔로잉", value: 30)
                }
                .padding(16)
            }.padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, spacing: 4) {
                Text(userToShowProfile.userName)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(userToShowProfile.fullName.orEmpty)
                    .font(.footnote)
                    .fontWeight(.semibold)
                Text(userToShowProfile.bio.orEmpty)
                    .font(.footnote)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom)
            
            // action button
            
            Button(action: {
                showEditProfile.toggle()
            }, label: {
                if userToShowProfile.isCurrentUser {
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
                let viewModel = ProfileEditViewModel(userToShowProfile: $userToShowProfile)
                ProfileEditView(viewModel: viewModel)
            })
    }
}

#Preview {
    ProfileHeaderView(userToShowProfile: .constant(.mock[0]))
}
