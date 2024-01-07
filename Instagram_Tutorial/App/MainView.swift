//
//  ContentView.swift
//  Instagram_Tutorial
//
//  Created by Bumgeun Song on 12/29/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel(
        authService: .shared
    )
    
    @StateObject private var signupViewModel = SignupViewModel(
        authService: .shared
    )
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView().environmentObject(signupViewModel)
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    MainView()
}
