//
//  ProfileEditView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/8/24.
//

import SwiftUI
import PhotosUI
import Kingfisher

struct ProfileEditView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ProfileEditViewModel
    
    var body: some View {
        VStack {
            // toolbar
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }, label: {
                        Text("Done")
                            .font(.subheadline)
                            .bold()
                    })
                }
                
            }
            .padding(.horizontal)
            
            Divider()
        }
        ZStack {
            if viewModel.isLoading {
                ProgressView("Uploading...").progressViewStyle(.circular)
            }
            VStack {
                // Profile
                PhotosPicker(selection: $viewModel.selectedImage) {
                    VStack {
                        CircularProfileImageView(user: viewModel.user, size: 80)
                        Text("Edit Profile Picture")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical)
                
                Divider()
                
                ProfileEditTextField(
                    title: "username",
                    placeholder: viewModel.username,
                    text: $viewModel.username
                )
                ProfileEditTextField(
                    title: "fullname",
                    placeholder: viewModel.fullname,
                    text: $viewModel.fullname
                )
                ProfileEditTextField(
                    title: "bio",
                    placeholder: viewModel.bio,
                    text: $viewModel.bio
                )
                
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileEditView(viewModel: ProfileEditViewModel(user: .mock[0]))
}
