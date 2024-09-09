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
                    CustomField(
                        object: $loginViewModel.email,
                        placeholder: "Email",
                        isSecure: false
                    )
                    .padding(.bottom)
                    
                    CustomField(
                        object: $loginViewModel.password,
                        placeholder: "******",
                        isSecure: true
                        )
                    .padding(.bottom)
                    
                    if(loginViewModel.showAlert){
                        AlertDialog(message: loginViewModel.errorMessage)
                            .frame(maxWidth: .infinity)
                            .padding(.bottom)
                    }
                }
                
                
                Button(action: {
                    loginViewModel.login()
                }) {
                    LoginButton(isLoading: $loginViewModel.isLoading, isSuccess: $loginViewModel.isLoggedIn)
                        .disabled(loginViewModel.isLoading)
                }
                .frame(maxWidth: .infinity)
                .disabled(loginViewModel.isLoading)
                Text("Esqueceu a senha?")
                    .foregroundStyle(.hlBlue)
                    .underline()
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
