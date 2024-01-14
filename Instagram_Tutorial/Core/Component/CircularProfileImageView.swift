//
//  CircularProfileImageView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/14/24.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    let user: User
    let size: CGFloat
    
    var body: some View {
        if let imageURL = user.profileImageURL {
            KFImage(URL(string: imageURL))
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: size, height: size)
                .clipShape(Circle())
        }
    }
}

#Preview {
    CircularProfileImageView(user: .mock[0], size: 48)
}
