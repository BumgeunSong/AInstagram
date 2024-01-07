//
//  User.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/4/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var userName: String = "unknown"
    var fullName: String?
    var bio: String?
    var profileImageURL: String?
    let email: String
}

extension User {
    static var mock: [User] = [
        User(id: UUID().uuidString, userName: "bumgeun.song", fullName: "Bumgeun Song", bio: "Lorem ipsum", profileImageURL: "Seoul", email: "bumgeun.song@gmail"),
        User(id: UUID().uuidString, userName: "London_boy", fullName: "London Boy", bio: "I am london boy", profileImageURL: "London", email: "London_boy@gmail"),
        User(id: UUID().uuidString, userName: "Eddy Song", fullName: "Bumgeun Song", bio: "Hey you", profileImageURL: "Seoul", email: "eddy.song@gmail"),
        User(id: UUID().uuidString, userName: "Eiffel_Tower", fullName: "John Maxell", bio: "Bon jeour", profileImageURL: "Paris", email: "john.maxell@gmail"),
    ]
}
