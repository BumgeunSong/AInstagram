//
//  EditProfileView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/13/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
           // toolbar
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Done")
                            .font(.subheadline)
                            .bold()
                    })
                }
                
            }
            .padding(.horizontal)
            
            Divider()
        }
        // Profile
        
        
    }
}

#Preview {
    EditProfileView()
}
