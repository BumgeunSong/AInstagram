//
//  PromptService.swift
//  AInstagram
//
//  Created by Bumgeun Song on 1/27/24.
//

import Foundation
import FirebaseFirestore

struct PromptService {
    private let promptDB = Firestore.firestore().collection("prompts")
    
    func fetchAllPrompts() async throws -> [Prompt] {
        return try await promptDB.getDocuments()
            .documents
            .compactMap { documents in
                try documents.data(as: Prompt.self)
            }
    }
}
