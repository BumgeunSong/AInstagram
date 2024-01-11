//
//  ProfileFollowButton.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/11/24.
//

import SwiftUI

struct ProfileFollowButton: View {
    var body: some View {
        Text("Follow")
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 32)
            .background(.white)
            .foregroundStyle(.black)
            .overlay(alignment: .center) {
                RoundedRectangle(
                    cornerSize: CGSize(width: 6, height: 6),
                    style: .circular
                ).stroke(.gray, lineWidth: 1)
            }
    }
}

#Preview {
    ProfileFollowButton()
}
