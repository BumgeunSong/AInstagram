//
//  ImageGenerator.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/14/24.
//

import UIKit
import OpenAIKit

struct ImageGenerator {
    
    private var apiKey: String? {
        return Bundle.main.object(forInfoDictionaryKey: "OpenAI_Key") as? String
    }
    
    func generate(from prompt: String) async -> UIImage? {
        guard let apiKey else { return nil }
        let openAI = OpenAI(.init(organizationId: "bumgeun.song", apiKey: apiKey))
        
        do {
            let imageParam = ImageParameters(
                prompt: prompt,
                resolution: .medium,
                responseFormat: .base64Json
            )
            
            let result = try await openAI.createImage(parameters: imageParam)
            let base64ImageData = result.data[0].image
            return try openAI.decodeBase64Image(base64ImageData)
        } catch {
            print("Failed to generate image: \(error.localizedDescription)")
            return nil
        }
    }
}
