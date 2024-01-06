//
//  ProfileView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        
        NavigationStack {
            ProfileStructureView(user: .MOCK_USERS[0])
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }
                }
        }
        
        
    }
}

#Preview {
    ProfileView()
}
