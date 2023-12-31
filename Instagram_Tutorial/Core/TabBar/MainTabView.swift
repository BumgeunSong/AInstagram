//
//  MainTabView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/29/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Feed")
                .tabItem { Image(systemName: "house") }
            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass") }
            Text("Upload Post")
                .tabItem { Image(systemName: "plus.square") }
            Text("Notifications")
                .tabItem { Image(systemName: "heart") }
            ProfileView()
                .tabItem { Image(systemName: "person") }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
}
