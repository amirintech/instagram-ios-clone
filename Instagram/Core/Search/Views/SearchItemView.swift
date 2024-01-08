//
//  SearchItemView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct SearchItemView: View {
    let user: User
    
    var body: some View {
        
        
        HStack {
            ProfileImageView(user: user, size: .extraSmall)
            
            VStack(alignment: .leading, spacing: 0.5) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                if let fullName = user.fullName {
                    Text(fullName)
                }
            }
            .font(.footnote)
            
            Spacer()
        }
        .padding(.horizontal)
        
        
    }
}

#Preview {
    SearchItemView(user: User.MOCK_USERS[0])
}
