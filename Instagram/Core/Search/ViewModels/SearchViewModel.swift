//
//  SearchViewModel.swift
//  Instagram
//
//  Created by Amir on 07/01/2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
