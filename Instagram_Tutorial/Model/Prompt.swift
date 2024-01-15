//
//  Prompt.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/15/24.
//

import Foundation

struct Prompt: Identifiable, Hashable {
    let id: String = UUID().uuidString
    let content: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(content)
    }
}
