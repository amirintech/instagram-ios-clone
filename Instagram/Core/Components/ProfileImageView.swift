//
//  ProfileImageVide.swift
//  Instagram
//
//  Created by Amir on 08/01/2024.
//

import SwiftUI
import Kingfisher

struct ProfileImageView: View {
    let user: User
    let size: ProfileImageSize
    
    var body: some View {
        
        
        if let profileImageUrl = user.profileImageUrl {
            KFImage(URL(string: profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
        } else {
            Image("default-profile-img")
                .resizable()
                .scaledToFill()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        
        
    }
}

enum ProfileImageSize {
    case extraSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .extraSmall: return 42
        case .small: return 48
        case .medium: return 64
        case .large: return 80
        }
    }
}

#Preview {
    ProfileImageView(user: .MOCK_USERS[0], size: .large)
}
