//
//  ContentView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @StateObject private var registerationViewModel = RegisterationViewModel()
    
    var body: some View {
        
        
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registerationViewModel)
            } else if let currentUser = viewModel.currentUser {
                TabBarView(user: currentUser)
            }
        }

        
    }
}

#Preview {
    ContentView()
}
