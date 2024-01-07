//
//  UserSummaryCell.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/1/24.
//

import SwiftUI

struct UserSummaryCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            Image(profileURL: user.profileImageURL)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            
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
    }
}

#Preview {
    UserSummaryCell(user: .mock[0])
}
