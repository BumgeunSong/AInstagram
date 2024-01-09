//
//  SearchViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import Foundation

@MainActor
final class SearchViewModel: ObservableObject {
    @Published var allUsers: [User] = []
    
    init() {
        Task { try await loadUsers() }
    }
    
    func loadUsers() async throws {
        self.allUsers = try await UserService().fetchAllUsers()
    }
}
