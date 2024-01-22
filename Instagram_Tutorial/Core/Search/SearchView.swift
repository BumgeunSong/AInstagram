//
//  SearchView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/1/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @State var searchText: String = ""
    @Binding var tabIndex: Int
    @Binding var userToShowProfile: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(viewModel.allUsers) { user in
                        UserSummaryCell(user: user, tabIndex: $tabIndex, userToShowprofile: $userToShowProfile)
                    }
                }
            }
            .refreshable {
                Task {
                    try await viewModel.loadUsers()
                }
            }
            .navigationTitle("탐색")
            .navigationBarTitleDisplayMode(.inline)
        }.searchable(
            text: $searchText,
            placement: .toolbar,
            prompt: "다른 유저의 아이디를 검색하세요"
        )
    }
}

#Preview {
    SearchView(tabIndex: .constant(TabIndex.search), userToShowProfile: .constant(.mock[0]))
}
