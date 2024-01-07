//
//  AuthService.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    private init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("로그인 에러: \(error.localizedDescription)")
        }
    }
    
    func createUser(email: String, password: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("회원가입 에러: \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() async throws {
        do {
            try Auth.auth().signOut()
            userSession = nil
        } catch {
            print("로그아웃 에러: \(error.localizedDescription)")
        }
    }
}
