//
//  UserSummaryCell.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/1/24.
//

import SwiftUI

struct UserSummaryCell: View {
    
    let user: UserData
    
    var body: some View {
        HStack {
            Image(user.profilePicture)
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(user.username)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(user.description)
                    .font(.footnote)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserSummaryCell(
        user: .init(
            username: "Eddy Song",
            description: "love writing / programming",
            profilePicture: .eddyDesc
        )
    )
}
