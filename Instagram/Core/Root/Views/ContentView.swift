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
            if viewModel.userSession != nil {
                TabBarView()
            } else {
                LoginView()
                    .environmentObject(registerationViewModel)
            }
        }
        
        
    }
}

#Preview {
    ContentView()
}
