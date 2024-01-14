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
    init(user: User) {
        self.selectedImage = nil
        self.username = user.userName
        self.fullname = user.fullName.orEmpty
        self.bio = user.bio.orEmpty
    }
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    @Published var profileImage: Image?
    @Published var username: String
    @Published var fullname: String
    @Published var bio: String
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
