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
        Task { try await loadCurrentUser() }
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            try await loadCurrentUser()
        } catch {
            print("로그인 에러: \(error.localizedDescription)")
        }
    }
    
    
    func createUser(email: String, password: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            await uploadUserInfo(uid: result.user.uid, email: email, username: userName)
            try await loadCurrentUser()
        } catch {
            print("회원가입 에러: \(error.localizedDescription)")
        }
    }
    
    func updateUser(userID: String, dataToUpdate: [String: Any]) async throws {
        try await userDB.document(userID).updateData(dataToUpdate)
    }
    
    func loadCurrentUser() async throws {
        let currentUser = Auth.auth().currentUser
        self.userSession = currentUser
        self.currentUser = try await loadData(of: currentUser)
    }
    
    func loadData(of user: FirebaseAuth.User?) async throws -> User? {
        guard let currentUID = user?.uid else { return nil }
        return await loadUserData(uid: currentUID)
    }
    
    func loadUserData(uid: String) async -> User? {
        guard let document = try? await userDB.document(uid).getDocument() else { return nil }
        return try? document.data(as: User.self)
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
