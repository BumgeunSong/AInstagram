//
//  SignupViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import Foundation

class SignupViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    
    let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func createUser() async throws {
        try await authService.createUser(email: email, password: password, userName: userName)
    }
}
