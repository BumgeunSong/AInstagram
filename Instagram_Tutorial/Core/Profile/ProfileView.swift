//
//  ProfileView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/29/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    let posts: [Post] = Post.mock
    
    @State var isSignoutAlertPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                UserPostGridView(user: user, posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isSignoutAlertPresented = true
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    })
                    .alert(
                        "로그아웃 하시겠어요?",
                        isPresented: $isSignoutAlertPresented,
                        presenting: false
                    ) { _ in
                        Button("취소", role: .cancel, action: {})
                        Button("로그아웃", action: {
                            Task {
                                try await AuthService.shared.signout()
                            }
                        })
                    }
                }
            })
        }
    }
}

#Preview {
    ProfileView(user: .mock[0])
}
