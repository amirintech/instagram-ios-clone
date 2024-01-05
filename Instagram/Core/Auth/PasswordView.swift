//
//  PasswordView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct PasswordView: View {
    @State private var password = ""
    
    var body: some View {
        
        
        SignUpStepView(title: "Create password", description: "Password must be at least 8 chahcters long.", textFieldPlaceholder: "Enter a password", actionLabel: "Next", nextView: CompleteSignUpView(), textFieldBinding: $password)
        
        
    }
}

#Preview {
    PasswordView()
}
