//
//  ProfileEditViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/8/24.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
final class ProfileEditViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedItem) }}
    }
    @Published var username: String
    @Published var fullname: String
    @Published var bio: String
    @Published var isLoading: Bool = false
    @Published var user: User
    @Binding var userToShowProfile: User
    
    @Published var selectedImage: UIImage?
    
    init(userToShowProfile: Binding<User>) {
        self._userToShowProfile = userToShowProfile
        
        let user = userToShowProfile.wrappedValue
        self.user = user
        self.selectedItem = nil
        self.username = user.userName
        self.fullname = user.fullName.orEmpty
        self.bio = user.bio.orEmpty
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.selectedImage = uiImage
    }
    
    func updateUserData() async throws {
        isLoading = true
        var dataToUpdate = [String: String]()
        
        if let selectedImage {
            let imageURL = try await ImageUploader.uploadImage(image: selectedImage)
            dataToUpdate["profileImageURL"] = imageURL
        }
        
        if username != user.userName {
            dataToUpdate["userName"] = username
        }
        
        if username != user.userName {
            dataToUpdate["fullname"] = fullname
        }
        
        if bio != user.bio {
            dataToUpdate["bio"] = bio
        }
        
        if dataToUpdate.isNotEmpty {
            try await AuthService.shared.updateUser(userID: user.id, dataToUpdate: dataToUpdate)
            isLoading = false
        }
        isLoading = false
    }
}
