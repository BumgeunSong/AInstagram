//
//  ImageGenerator.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/14/24.
//

import UIKit
import OpenAIKit
import Firebase
import FirebaseFirestore

struct ImageGenerator {
    
    private var apiKey: String? {
        return Bundle.main.object(forInfoDictionaryKey: "OpenAI_Key") as? String
    }
    
    private var currentDateString: String {
        return Date.now.formatted(date: .abbreviated, time: .omitted)
    }
    
    private let usageDB = Firestore.firestore().collection("usage")
    
    func generate(from prompt: String, by user: User) async -> UIImage? {
        guard let apiKey else { return nil }
        if prompt.isEmpty { return nil }
        
        let openAI = OpenAI(.init(organizationId: "bumgeun.song", apiKey: apiKey))
        
        do {
            let imageParam = ImageParameters(
                prompt: prompt,
                resolution: .medium,
                responseFormat: .base64Json
            )
            
            let result = try await openAI.createImage(parameters: imageParam)
            try await incrementUsage(of: user)
            
            let base64ImageData = result.data[0].image
            return try openAI.decodeBase64Image(base64ImageData)
        } catch {
            if let openAIError = error as? OpenAIErrorResponse {
                print("==================")
                print("code: \(String(describing: openAIError.error.code))")
                print("message: \(openAIError.error.message)")
                print("message: \(openAIError.error.localizedDescription)")
                print("==================")
            }
            print("Failed to generate image: \(error.localizedDescription)")
            return nil
        }
    }
    
    func incrementUsage(of user: User) async throws {
        try await usageDB.document(user.id).setData([
            "\(currentDateString)": FieldValue.increment(Int64(1))
        ])
    }
    
    func usageOfToday(user: User) async -> Int? {
        guard let document = try? await usageDB.document(user.id).getDocument() else { return nil }
        return try? document.data(as: [String: Int].self)[currentDateString]
    }
}
