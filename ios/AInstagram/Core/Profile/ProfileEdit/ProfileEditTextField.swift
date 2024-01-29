//
//  EditProfileTextField.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/14/24.
//

import SwiftUI

struct ProfileEditTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            LabeledContent {
                TextField(placeholder, text: $text)
                    .padding(.leading)
                    .font(.subheadline)
                    .frame(height: 36)
            } label: {
                Text(title)
                    .fontWeight(.semibold)
            }
            Divider()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileEditTextField(title: "name", placeholder: "eddy", text: .constant(""))
}
