//
//  EditProfileView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/13/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedImage: PhotosPickerItem?
    
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
        
        PhotosPicker(selection: $selectedImage) {
            VStack {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(.white)
                    .background(.gray)
                    .clipShape(Circle())
                
                Text("Edit Profile Picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
        }
        .padding(.vertical, 8)
        
    }
}

#Preview {
    EditProfileView()
}
