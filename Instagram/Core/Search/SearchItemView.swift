//
//  SearchItemView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct SearchItemView: View {
    var body: some View {
        
        
        HStack {
            Image("ned-stark")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .leading, spacing: 0.5) {
                Text("nedstark")
                    .fontWeight(.semibold)
                
                Text("Edard Stark")
            }
            .font(.footnote)
            
            Spacer()
        }
        .padding(.horizontal)
        
        
    }
}

#Preview {
    SearchItemView()
}
