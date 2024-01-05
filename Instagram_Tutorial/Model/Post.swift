//
//  Post.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/5/24.
//

import Foundation

struct Post: Identifiable, Codable {
    let id: String
    let creator: User
    let imageURL: String
    let likes: Int
    let caption: String?
    let createdAt: Date
}

extension Post {
    static var mock: [Post] = [
        Post(
            id: UUID().uuidString,
            creator: .mock[0],
            imageURL: "sunset",
            likes: 5,
            caption: "Beatiful Sunset",
            createdAt: .now
        ),
        Post(
            id: UUID().uuidString,
            creator: .mock[1],
            imageURL: "surf",
            likes: 255,
            caption: "Let's go surf. consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            createdAt: .now
        ),
        Post(
            id: UUID().uuidString,
            creator: .mock[2],
            imageURL: "flower",
            likes: 6,
            caption: "The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets.",
            createdAt: .now
        ),
        Post(
            id: UUID().uuidString,
            creator: .mock[3],
            imageURL: "house",
            likes: 1,
            caption: nil,
            createdAt: .now
        ),
    ]
}
