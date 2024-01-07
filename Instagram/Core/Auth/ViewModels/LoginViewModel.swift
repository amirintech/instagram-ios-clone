//
//  LoginViewModel.swift
//  Instagram
//
//  Created by Amir on 07/01/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
