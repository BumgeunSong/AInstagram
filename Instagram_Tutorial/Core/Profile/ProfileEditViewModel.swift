//
//  ProfileEditViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/8/24.
//

import SwiftUI
import PhotosUI

final class ProfileEditViewModel: ObservableObject {
    init(user: User) {
        self.selectedImage = nil
        self.username = user.userName
        self.fullname = user.fullName.orEmpty
        self.bio = user.bio.orEmpty
    }
    
    @Published var selectedImage: PhotosPickerItem?
    @Published var username: String
    @Published var fullname: String
    @Published var bio: String
}
