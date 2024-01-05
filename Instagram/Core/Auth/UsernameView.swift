//
//  UsernameView.swift
//  Instagram
//
//  Created by Amir on 06/01/2024.
//

import SwiftUI

struct UsernameView: View {
    @State private var username = ""
    
    var body: some View {
        
        
        SignUpStepView(title: "Create username", description: "Your username will be used to identify your account.", textFieldPlaceholder: "Enter a username", actionLabel: "Next", nextView: PasswordView(), textFieldBinding: $username)
        
        
    }
}

#Preview {
    UsernameView()
}
