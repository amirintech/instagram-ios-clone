//
//  EmailView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct EmailView: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        
        SignUpStepView(title: "Add your email", description: "You will use this email to login to your account.", textFieldPlaceholder: "Enter your email", actionLabel: "Next", nextView: UsernameView(), textFieldBinding: $email)
        
        
    }
}

#Preview {
    EmailView()
}
