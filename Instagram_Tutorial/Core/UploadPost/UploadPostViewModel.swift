//
//  UploadPostViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/6/24.
//

import UIKit

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var currentPrompt: String = ""
    @Published var selectedPrompt: Prompt? {
        didSet {
            if let content = selectedPrompt?.content {
                currentPrompt = content
            }
        }
    }
    @Published var recentPrompts: [Prompt] = []
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    private var imageLoadingTask: Task<UIImage?, Never>?
    
    func loadRecentPrompts() async {
        self.recentPrompts = [
            "Generate a stunning concept for an expansive fantasy world, complete with enchanted forests, towering castles, and mythical creatures, setting the stage for a grand adventure.",
            "Generate a cartoon character in the style of classic Disney animation, with large, expressive eyes and whimsical features.",
            "Generate poetic images of nature, blending landscapes and elements to convey the beauty and harmony of the natural world for nature-centric blogs/environmental causes.",
            "Create stunning photos capturing the essence of a high-fashion runway show, featuring the latest couture."
        ].map({ content in
            Prompt(content: content)
        })
    }
    
    func loadImage() async {
        if let imageLoadingTask {
            return print(">>>>> Duplicate API Call")
        }
        
        self.imageLoadingTask = Task {
            return await ImageGenerator().generate(from: currentPrompt)
        }
        
        isLoading = true
        self.image = await imageLoadingTask?.value
        isLoading = false
        
        self.imageLoadingTask = nil
    }
    
    func reset() {
        self.currentPrompt = .empty
        self.selectedPrompt = nil
        self.image = nil
    }
}
