//
//  User.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/4/24.
//

import Foundation
import Firebase

struct User: Identifiable, Codable {
    let id: String
    var userName: String = "unknown"
    var fullName: String?
    var bio: String?
    var profileImageURL: String?
    let email: String
    
    var isCurrentUser: Bool {
        guard let currentUID = Auth.auth().currentUser?.uid else { return false }
        return currentUID == id
    }
}

extension User {
    static var mock: [User] = [
        User(id: UUID().uuidString, userName: "bumgeun.song", fullName: "Bumgeun Song", bio: "Lorem ipsum", profileImageURL: nil, email: "bumgeun.song@gmail"),
        User(id: UUID().uuidString, userName: "London_boy", fullName: "London Boy", bio: "I am london boy", profileImageURL: nil, email: "London_boy@gmail"),
        User(id: UUID().uuidString, userName: "Eddy Song", fullName: "Bumgeun Song", bio: "Hey you", profileImageURL: nil, email: "eddy.song@gmail"),
        User(id: UUID().uuidString, userName: "Eiffel_Tower", fullName: "John Maxell", bio: "Bon jeour", profileImageURL: nil, email: "john.maxell@gmail"),
    ]
}
