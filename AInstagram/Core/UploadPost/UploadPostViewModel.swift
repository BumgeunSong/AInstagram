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
            if let content = selectedPrompt?.content {
                currentPrompt = content
            }
        }
    }
    @Published var recentPrompts: [Prompt] = []
    @Published var isLoading: Bool = false
    @Published var usageLeftToday: Int?
    private var imageLoadingTask: Task<UIImage?, Never>?
    
    func loadRecentPrompts() async {
        self.recentPrompts = [
            "Generate a stunning concept for an expansive fantasy world, complete with enchanted forests, towering castles, and mythical creatures, setting the stage for a grand adventure.",
            "Generate a cartoon character in the style of classic Disney animation, with large, expressive eyes and whimsical features.",
            "Cityscape painting during a rainy day, focusing on reflections in puddles with a mix of soft and harsh brush strokes.",
            "Surreal painting of a child dreaming about floating among stars, using soft, dreamy colors and elements of fantasy.",
            "Generate poetic images of nature, blending landscapes and elements to convey the beauty and harmony of the natural world for nature-centric blogs/environmental causes.",
            "Create stunning photos capturing the essence of a high-fashion runway show, featuring the latest couture."
        ].map({ content in
            Prompt(content: content)
        })
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
    
    func uploadPost(image: UIImage?) async throws {
        guard let user = AuthService.shared.currentUser, let caption = selectedPrompt?.content else { return }
        
        guard let image, let imageURL = try await ImageUploader.uploadImage(image: image) else {
            return
        }
        
        let post = Post(
            id: UUID().uuidString,
            creator: user,
            imageURL: imageURL,
            likes: 0,
            caption: caption,
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
