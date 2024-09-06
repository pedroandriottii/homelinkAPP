//
//  LoginView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginViewModel = LoginViewModel()

    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text("Login")
                    .foregroundColor(.white)
                    .font(.title)
                VStack{
                    TextField("", text: $loginViewModel.email, prompt: Text("Email").foregroundColor(.gray))
                        .padding()
                        .frame(height: 50)
                        .background(Color.hlSeccondary)
                        
                        .cornerRadius(12)
                        .padding(.bottom)
                    
                    CustomSecureField(
                        password: $loginViewModel.password,
                        placeholder: "******",
                        placeholderColor: .gray,
                        backgroundColor: Color.hlSeccondary
                        )
                    .padding(.bottom)
                    
                    if(loginViewModel.showAlert){
                        AlertDialog(message: loginViewModel.errorMessage)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom)
                    }
                }
                .foregroundColor(.white)
                
                
                Button(action: {
                    loginViewModel.login()
                }) {
                    LoginButton(isLoading: $loginViewModel.isLoading, isSuccess: $loginViewModel.isLoggedIn)
                        .disabled(loginViewModel.isLoading)
                }
                .frame(maxWidth: .infinity)
                .disabled(loginViewModel.isLoading)
                Spacer()
            }
            .padding()
            .fullScreenCover(isPresented: $loginViewModel.isLoggedIn){
                HomeView()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hlBackground)
    }
}

#Preview {
    LoginView()
}
