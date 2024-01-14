//
//  AuthService.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService()
    
    private let userDB = Firestore.firestore().collection("users")
    
    private init() {
        Task { try await loadUserData() }
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            try await loadUserData()
        } catch {
            print("로그인 에러: \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, password: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            await uploadUserInfo(uid: result.user.uid, email: email, username: userName)
            try await loadUserData()
        } catch {
            print("회원가입 에러: \(error.localizedDescription)")
        }
    }
    
    func updateUser(userID: String, data: [String: String]) async throws {
        guard let encodedData = try? Firestore.Encoder().encode(data) else { return }
        try await userDB.document(userID).setData(encodedData)
    }
    
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUID = userSession?.uid else { return }
        guard let document = try? await userDB.document(currentUID).getDocument() else { return }
        self.currentUser = try? document.data(as: User.self)
    }
    
    func signout() async throws {
        do {
            try Auth.auth().signOut()
            userSession = nil
        } catch {
            print("로그아웃 에러: \(error.localizedDescription)")
        }
    }
    
    private func uploadUserInfo(uid: String, email: String, username: String) async {
        let user = User(id: uid, userName: username, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return }
        try? await userDB.document(user.id).setData(encodedUser)
    }
}
