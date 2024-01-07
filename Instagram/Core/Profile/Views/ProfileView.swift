//
//  ProfileView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        
        
        NavigationStack {
            ProfileStructureView(user: user)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            AuthService.shared.signOut()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.black)
                        }
                    }
                }
        }
        
        
    }
}

#Preview {
    ProfileView(user: .MOCK_USERS[0])
}
