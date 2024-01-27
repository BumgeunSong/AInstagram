//
//  Prompt.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/15/24.
//

import Foundation

struct Prompt: Identifiable, Hashable, Codable {
    let id: String
    let text: String
    let imageURL: URL?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(text)
        hasher.combine(imageURL)
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case imageURL = "imageUrl"
    }
}
