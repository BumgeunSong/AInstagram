//
//  SearchView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/1/24.
//

import SwiftUI

struct SearchView: View {
    @State var text: String = ""
    
    let dummyUsers: [UserData] = [
        UserData(
            username: "Kim_Garden",
            description: "Hey you",
            profilePicture: .seoul
        ),
        UserData(
            username: "Eddy Song",
            description: "How to beat procrastination",
            profilePicture: .eddyDesc
        ),
        UserData(
            username: "London boy",
            description: "love England",
            profilePicture: .london
        ),
        UserData(
            username: "Eiffel_Tower",
            description: "Bon jeour",
            profilePicture: .paris
        )
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(dummyUsers, id: \.id) { user in
                        UserSummaryCell(user: user)
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }.searchable(
            text: $text,
            placement: .toolbar,
            prompt: "다른 유저의 아이디를 검색하세요"
        )
    }
}

#Preview {
    SearchView()
}

struct UserData: Identifiable {
    let id: UUID = UUID()
    let username: String
    let description: String
    let profilePicture: ImageResource
}
