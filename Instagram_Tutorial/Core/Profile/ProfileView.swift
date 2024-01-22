//
//  ProfileView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/29/23.
//

import SwiftUI

struct ProfileView: View {

    let posts: [Post] = Post.mock
    
    @Binding var userToShowProfile: User
    @State var isSignoutAlertPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(userToShowProfile: $userToShowProfile)
                UserPostGridView(user: userToShowProfile, posts: posts)
            }
            .navigationTitle("프로필")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isSignoutAlertPresented = true
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.accent)
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
    ProfileView(userToShowProfile: .constant(.mock[0]))
}
