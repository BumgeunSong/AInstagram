//
//  UploadPostViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/6/24.
//

import UIKit

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var prompt: String = ""
    @Published var recentPrompts: [String] = []
    @Published var image: UIImage?
    
    func loadRecentPrompts() async {
        self.recentPrompts = [
            "Generate a stunning concept for an expansive fantasy world, complete with enchanted forests, towering castles, and mythical creatures, setting the stage for a grand adventure.",
            "Generate a cartoon character in the style of classic Disney animation, with large, expressive eyes and whimsical features.",
            "Generate poetic images of nature, blending landscapes and elements to convey the beauty and harmony of the natural world for nature-centric blogs/environmental causes.",
            "Create stunning photos capturing the essence of a high-fashion runway show, featuring the latest couture."
        ]
    }
    
    func loadImage() {
        Task {
            self.image = await ImageGenerator().generate(from: prompt)
        }
    }
}
