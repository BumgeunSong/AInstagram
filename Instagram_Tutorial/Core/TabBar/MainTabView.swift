//
//  MainTabView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/29/23.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .tabItem { Image(systemName: "house") }
                .tag(TabIndex.feed)
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(TabIndex.search)
            UploadPostView(tabIndex: $selectedIndex)
                .tabItem { Image(systemName: "plus.square") }
                .tag(TabIndex.uploadPost)
            Text("Notifications")
                .tabItem { Image(systemName: "heart") }
                .tag(TabIndex.notifications)
            ProfileView(user: .mock[0])
                .tabItem { Image(systemName: "person") }
                .tag(TabIndex.profile)
        }
        .tint(.black)
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
    MainTabView()
}
