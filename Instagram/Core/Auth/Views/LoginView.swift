//
//  LoginView.swift
//  Instagram
//
//  Created by Amir on 05/01/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    let dividerMaxWidth = UIScreen.main.bounds.width / 2
    
    var body: some View {
        
        
        NavigationStack {
            VStack {
                Spacer()
                
                // MARK: Logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                // MARK: Text fields
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(TextFieldModifier())
                        .textInputAutocapitalization(.never)
                        
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(TextFieldModifier())
                }
                
                // MARK: Forgot password
                Button {
                    print("Forgot Password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
                
                // MARK: Login button
                Button {
                    Task { try await viewModel.login() }
                } label: {
                    Text("Login")
                        .modifier(PrimaryButtonLabelModifier())
                }
                .padding()
                
                
                // MARK: Continue with facebook
                HStack {
                    Rectangle()
                        .frame(maxWidth: dividerMaxWidth, maxHeight: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(maxWidth: dividerMaxWidth, maxHeight: 0.5)
                }
                .padding(.horizontal)
                .foregroundStyle(.gray)
                
                Button {
                    
                } label: {
                    HStack {
                        Image("facebook")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                        Text("continue with Facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.top)
                
                Spacer()
                
                Divider()
                
                // MARK: Sign up
                NavigationLink {
                    EmailView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack {
                        Text("Don't have an account? ") +
                        Text("Sign up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.top)
            }
        }
        
        
        
    }
}

#Preview {
    LoginView()
}
