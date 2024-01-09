//
//  SearchViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import Foundation

@MainActor
final class SearchViewModel: ObservableObject {
    private var allResult: [User] = []
    @Published var searchResult: [User] = []
    @Published var searchText: String = "" {
        didSet {
            guard searchText.isNotEmpty else {
                searchResult = allResult
                return
            }
            
            let newResult = allResult.filter { user in
                user.userName.range(of: searchText, options: .caseInsensitive) != nil
            }
            searchResult = newResult
        }
    }
    
    init() {
        Task { try await loadUsers() }
    }
    
    func loadUsers() async throws {
        self.allResult = try await UserService().fetchAllUsers()
    }
}
