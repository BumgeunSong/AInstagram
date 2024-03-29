//
//  EditProfileButton.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/11/24.
//

import SwiftUI

struct ProfileEditButton: View {
    var body: some View {
        Text("프로필 편집")
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 32)
            .background(.white)
            .foregroundStyle(.black)
            .overlay(alignment: .center) {
                RoundedRectangle(
                    cornerSize: CGSize(width: 6, height: 6),
                    style: .circular
                ).stroke(.black, lineWidth: 1)
            }
    }
}

#Preview {
    ProfileEditButton()
}
