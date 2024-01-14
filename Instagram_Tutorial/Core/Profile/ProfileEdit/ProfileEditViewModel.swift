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
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    @Published var profileImage: Image?
    @Published var username: String
    @Published var fullname: String
    @Published var bio: String
    private var user: User
    
    private var profileUIImage: UIImage?
    
    init(user: User) {
        self.user = user
        self.selectedImage = nil
        self.username = user.userName
        self.fullname = user.fullName.orEmpty
        self.bio = user.bio.orEmpty
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileUIImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        
        var dataToUpdate = [String: Any]()
        
        if let profileUIImage {
            let imageURL = try await ImageUploader.uploadImage(image: profileUIImage)
            dataToUpdate["profileImageURL"] = imageURL
        }
        
        let updatedUser = User(id: user.id, userName: username, fullName: fullname, bio: bio, profileImageURL: nil, email: user.email)
        try await AuthService.shared.updateUser(user: updatedUser)
    }
}
