//
//  LoginView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/2/24.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
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
                EmailPasswordTextField(
                    email: $viewModel.email,
                    password: $viewModel.password
                )
                
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
                    Task { try await viewModel.login() }
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
                
                Text("or").font(.footnote)
                
                Button(action: {
                    print("Sign in with Apple")
                }, label: {
                    SignInWithAppleButton(onRequest: {_ in
                        print("onRequest")
                    }, onCompletion: {_ in
                        print("onCompletion")
                    })
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .padding(.horizontal, 24)
                    .background(.background)
                })
                .padding(.vertical)
                
                Spacer()
                
                Divider().padding(.horizontal)
                NavigationLink {
                    EnterEmailView()
                        
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
