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
                VStack(alignment: .leading, spacing: 4) {
                    Text("Bumgeun Song")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Text("love writing / programming")
                        .font(.footnote)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.horizontal)
                
                // action button
                Button(action: {
                    
                }, label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundStyle(.black)
                        .overlay(alignment: .center) {
                            RoundedRectangle(
                                cornerSize: CGSize(
                                    width: 6,
                                    height: 6
                                ),
                                style: .circular
                            ).stroke(.gray)
                        }
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
