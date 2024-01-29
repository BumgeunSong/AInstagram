//
//  FeedViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/18/24.
//

import SwiftUI

@MainActor
final class FeedViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        Task { await loadPosts() }
    }
    
    func loadPosts() async {
        do {
            self.posts = try await PostService.loadAllPost()
        } catch {
            print(error.localizedDescription)
        }
    }
}
