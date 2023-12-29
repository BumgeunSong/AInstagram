//
//  ProfileView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/29/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            // header
            VStack {
                /// pic and stats
                HStack {
                    
                }
                
                // name and bio
                VStack {
                    
                }
                
                // action button
                Button(action: {
                    
                }, label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundStyle(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.gray)
                        )
                })
                
                Divider()
            }
            
            // post grid view
        }
    }
}

#Preview {
    ProfileView()
}
