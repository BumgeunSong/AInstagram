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
    @Published var currentUser: User? = nil
    
    init(authService: AuthService) {
        self.authService = authService
        subscribeSession()
    }
    
    func subscribeSession() {
        authService.$userSession
            .receive(on: DispatchQueue.main)
            .sink { userSession in
                self.userSession = userSession
            }
            .store(in: &cancellables)
        
        authService.$currentUser
            .receive(on: DispatchQueue.main)
            .sink { currentUser in
                self.currentUser = currentUser
            }
            .store(in: &cancellables)
        
    }
}
