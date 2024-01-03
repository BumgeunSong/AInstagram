//
//  LoginView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/2/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
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
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.none)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(uiColor: .systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 24)
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(uiColor: .systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 24)
                }
                
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
                    Text("Sign up")
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
