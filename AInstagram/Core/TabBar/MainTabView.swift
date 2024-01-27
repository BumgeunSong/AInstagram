//
//  MainTabView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/29/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex: Int = 0
    let currentUser: User
    @State var userToShowProfile: User
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .tabItem { Image(systemName: "house") }
                .tag(TabIndex.feed)
                .padding(.vertical, 8)
            SearchView(tabIndex: $selectedIndex, userToShowProfile: $userToShowProfile)
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(TabIndex.search)
                .padding(.vertical, 8)
            UploadPostView(tabIndex: $selectedIndex)
                .tabItem { Image(systemName: "plus.square") }
                .tag(TabIndex.uploadPost)
                .padding(.vertical, 8)
            Text("업데이트 예정이에요!")
                .tabItem { Image(systemName: "heart") }
                .tag(TabIndex.notifications)
                .padding(.vertical, 8)
            ProfileView(userToShowProfile: $userToShowProfile)
                .tabItem { Image(systemName: "person") }
                .tag(TabIndex.profile)
                .padding(.vertical, 8)
        }
    }
}

enum TabIndex {
    static let feed = 0
    static let search = 1
    static let uploadPost = 2
    static let notifications = 3
    static let profile = 4
}

#Preview {
    MainTabView(currentUser: .mock[0], userToShowProfile: .mock[0])
}
