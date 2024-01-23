//
//  UserService.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/9/24.
//

import Foundation
import FirebaseFirestore

struct UserService {
    
    private let userDB = Firestore.firestore().collection("users")
    
    func fetchAllUsers() async throws -> [User] {
        return try await userDB
            .getDocuments()
            .documents
            .compactMap { documents in
            try documents.data(as: User.self)
        }
    }
}
