//
//  UserSummaryCell.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/1/24.
//

import SwiftUI

struct UserSummaryCell: View {
    
    let user: User
    @Binding var tabIndex: Int
    @Binding var userToShowprofile: User
    
    var body: some View {
        Button(action: {
            tabIndex = TabIndex.profile
            userToShowprofile = user
        }, label: {
            HStack {
                CircularProfileImageView(user: user, size: 48)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.userName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text(user.bio ?? "")
                        .font(.footnote)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding(.horizontal)
        })
    }
}

#Preview {
    UserSummaryCell(user: .mock[0], tabIndex: .constant(TabIndex.search), userToShowprofile: .constant(.mock[0]))
}
