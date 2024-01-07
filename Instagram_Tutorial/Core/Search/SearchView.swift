//
//  SearchView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/1/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(viewModel.searchResult) { user in
                        UserSummaryCell(user: user)
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }.searchable(
            text: $viewModel.searchText,
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
