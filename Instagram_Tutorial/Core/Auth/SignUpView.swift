//
//  SignUpView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/3/24.
//

import SwiftUI
import AuthenticationServices

struct SignUpView: View {
    var body: some View {
        Button(action: {
            print("Sign in with Apple")
        }, label: {
            VStack {
                Image(.instagramTypoLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 110)
                SignInWithAppleButton(onRequest: {_ in
                    print("onRequest")
                }, onCompletion: {_ in
                    print("onCompletion")
                })
                .frame(maxWidth: .infinity, maxHeight: 44)
                .padding(.horizontal, 24)
                .background(.background)
            }
        })
        .padding(.vertical)
    }
}

#Preview {
    SignUpView()
}
