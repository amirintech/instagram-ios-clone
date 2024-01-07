//
//  EmailView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct EmailView: View {
    @EnvironmentObject private var viewModel: RegisterationViewModel
    
    var body: some View {
        
        
        RegisterationStepView(title: "Add your email", description: "You will use this email to login to your account.", textFieldPlaceholder: "Enter your email", actionLabel: "Next", nextView: UsernameView(), textFieldBinding: $viewModel.email)
        
        
    }
}

#Preview {
    EmailView()
}
