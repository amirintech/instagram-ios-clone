//
//  ProfileStatView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct ProfileStatView: View {
    var title: String
    var value: Int
    
    var body: some View {
        
        
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
        }
        .frame(width: 78)
        
    }
}

#Preview {
    ProfileStatView(title: "Followers", value: 19)
}
