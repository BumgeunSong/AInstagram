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
                        Text("취소")
                    })
                    
                    Spacer()
                    
                    Text("프로필 수정")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }, label: {
                        Text("완료")
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
                ProgressView("업로드 중...").progressViewStyle(.circular)
            }
            VStack {
                // Profile
                PhotosPicker(selection: $viewModel.selectedItem) {
                    VStack {
                        if let selectedImage = viewModel.selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } else {
                            CircularProfileImageView(user: viewModel.user, size: 80)
                        }
                        
                        Text("프로필 사진 수정")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical)
                
                Divider()
                
                ProfileEditTextField(
                    title: "닉네임",
                    placeholder: viewModel.username,
                    text: $viewModel.username
                )
                ProfileEditTextField(
                    title: "이름",
                    placeholder: viewModel.fullname,
                    text: $viewModel.fullname
                )
                ProfileEditTextField(
                    title: "바이오",
                    placeholder: viewModel.bio,
                    text: $viewModel.bio
                )
                
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileEditView(
        viewModel: ProfileEditViewModel(
            userToShowProfile: .constant(.mock[0])
        )
    )
}
