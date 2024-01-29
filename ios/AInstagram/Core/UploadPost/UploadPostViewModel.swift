//
//  UploadPostViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/6/24.
//

import UIKit

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var currentPrompt: String = .empty
    @Published var selectedPrompt: Prompt? {
        didSet {
            if let content = selectedPrompt?.text {
                currentPrompt = content
            }
        }
    }
    @Published var recommendedPrompts: [Prompt] = []
    @Published var showingRecommendedPrompts = false
    @Published var isLoading: Bool = false
    @Published var usageLeftToday: Int?
    private var imageLoadingTask: Task<UIImage?, Never>?
    
    func loadRecentPrompts() async {
        Task {
            do {
                self.recommendedPrompts = try await PromptService().fetchAllPrompts()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func loadImage() async {
        guard let user = AuthService.shared.currentUser else {
            return
        }
        
        if imageLoadingTask != nil {
            return print(">>>>> Duplicate API Call")
        }
        
        self.imageLoadingTask = Task {
            return await ImageGenerator().generate(from: currentPrompt, by: user)
        }
        
        isLoading = true
        let image = await imageLoadingTask?.value
        self.imageLoadingTask = nil
        
        Task {
            do {
                try await uploadPost(image: image, currentPrompt: currentPrompt)
                reset()
            } catch {
                print("Upload Post 에러:", error.localizedDescription)
            }
        }
        
        isLoading = false
        
    }
    
    func loadUsage() async {
        guard let user = AuthService.shared.currentUser,
              let usageOfToday = await ImageGenerator().usageOfToday(user: user) else {
            return
        }
        
        let maxUsage = 3
        self.usageLeftToday = maxUsage - usageOfToday
    }
    
    func uploadPost(image: UIImage?, currentPrompt: String) async throws {
        guard let user = AuthService.shared.currentUser else { return }
        
        guard let image, let imageURL = try await ImageUploader.uploadImage(image: image) else {
            return
        }
        
        let post = Post(
            id: UUID().uuidString,
            creator: user,
            imageURL: imageURL,
            likes: 0,
            caption: currentPrompt,
            createdAt: .now
        )
        
        await PostService.upload(post: post)
        
        try await AuthService.shared.updateUser(
            userID: user.id,
            dataToUpdate: ["lastUploadAt": Date.now.ISO8601Format()]
        )
    }
    
    func reset() {
        self.currentPrompt = .empty
        self.selectedPrompt = nil
    }
}
