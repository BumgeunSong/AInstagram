//
//  LoginView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/2/24.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                // logo image
                Image(.instagramTypoLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 110)
                
                // text fields
                EmailPasswordTextField()
                
                Button(action: {
                    print("Forgot Password")
                }, label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 24)
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button(action: {
                    print("Login")
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, maxHeight: 44)
                        .foregroundStyle(.white)
                        .background(Color(uiColor: .systemBlue))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .padding(.horizontal, 24)
                })
                .padding(.vertical)
                
                Divider().padding(.horizontal)
                Spacer()
                Divider().padding(.horizontal)
                NavigationLink {
                    SignUpView()
                } label: {
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    LoginView()
}
