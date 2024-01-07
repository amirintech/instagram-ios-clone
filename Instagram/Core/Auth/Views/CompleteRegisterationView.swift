//
//  CompleteSignUpView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct CompleteRegisterationView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var viewModel: RegisterationViewModel
    
    var body: some View {
        
        
        VStack {
            Spacer()
            
            // MARK: Title & description
            Text("Welcome to Instagram, \(viewModel.username)")
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text("Click below to complete your registration and start using Instagram.")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            
            // MARK: Action button
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Complete Sign Up")
                    .modifier(PrimaryButtonLabelModifier())
            }
            .padding()
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
        
        
    }
}

#Preview {
    CompleteRegisterationView()
}
