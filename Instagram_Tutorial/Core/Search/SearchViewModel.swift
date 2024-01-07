//
//  SearchViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import Foundation
import FirebaseFirestore

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
                user.userName.range(of: user.userName, options: .caseInsensitive) != nil
            }
            searchResult = newResult
            
        }
    }
    
    private let userDB = Firestore.firestore().collection("users")
    
    init() {
        Task { await loadUsers() }
    }
    
    func loadUsers() async {
        guard let query = try? await userDB.getDocuments() else { return }
        
        let results = query.documents.compactMap { documents in
            try? documents.data(as: User.self)
        }
        
        allResult = results
        searchResult = results
    }
    
    func search(_ searchText: String) async {
        guard let querySnapshot = try? await userDB
                .whereField("username", isEqualTo: searchText)
                .whereField("bio", isEqualTo: searchText)
                .getDocuments() else { return }
        
        let results = querySnapshot.documents.compactMap { documents in
            try? documents.data(as: User.self)
        }
        
        searchResult = results
    }
}
