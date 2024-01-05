//
//  SignUpStepView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct SignUpStepView<Destination: View>: View {
    let title: String
    let description: String
    let textFieldPlaceholder: String
    let actionLabel: String
    let nextView: Destination
    
    var isSecuredField = false
    
    @Binding var textFieldBinding: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        VStack {
            // MARK: Title & description
            Text(title)
                .font(.title2)
                .bold()
                .padding(.top)
            
            Text(description)
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // MARK: Text field
            if isSecuredField {
                SecureField(textFieldPlaceholder, text: $textFieldBinding)
                    .modifier(TextFieldModifier())
                    .padding(.top)
            } else {
                TextField(textFieldPlaceholder, text: $textFieldBinding)
                    .modifier(TextFieldModifier())
                    .padding(.top)
            }
            
            
            // MARK: Action button
            NavigationLink(destination: nextView.navigationBarBackButtonHidden()) {
                Text(actionLabel)
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
    SignUpStepView(title: "Add your email", description: "You will use this email to sign in to your account.", textFieldPlaceholder: "Enter your email", actionLabel: "Next", nextView: Text("Done!"), textFieldBinding: .constant(""))
}
