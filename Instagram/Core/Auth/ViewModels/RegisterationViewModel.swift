//
//  RegisterationViewMode.swift
//  Instagram
//
//  Created by Amir on 07/01/2024.
//

import Foundation

class RegisterationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
}
