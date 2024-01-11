//
//  EditProfileButton.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/11/24.
//

import SwiftUI

struct EditProfileButton: View {
    var body: some View {
        Text("Edit Profile")
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 32)
            .background(Color(.systemBlue))
            
            .foregroundStyle(.white)
            .overlay(alignment: .center) {
                RoundedRectangle(
                    cornerSize: CGSize(width: 6, height: 6),
                    style: .circular
                ).stroke(.clear, lineWidth: 1)
            }
    }
}

#Preview {
    EditProfileButton()
}
