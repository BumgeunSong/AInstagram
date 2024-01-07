//
//  MainViewModel.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 1/7/24.
//

import Foundation
import FirebaseAuth
import Combine

@MainActor
final class MainViewModel: ObservableObject {
    
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    @Published var userSession: FirebaseAuth.User?
    
    init(authService: AuthService) {
        self.authService = authService
        subscribeSession()
    }
    
    func subscribeSession() {
        authService.$userSession.sink { userSession in
            self.userSession = userSession
        }
        .store(in: &cancellables)
    }
}
