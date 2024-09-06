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
            TextField("Email", text: $loginViewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Senha", text: $loginViewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                loginViewModel.login()
            }) {
                Text("Entrar")
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .cornerRadius(5)
            }
            .padding()
            .disabled(loginViewModel.isLoading)
            if(loginViewModel.showAlert){
                Text(loginViewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .fullScreenCover(isPresented: $loginViewModel.isLoggedIn){
            HomeView()
        }
        .background(Color.blue)
        .alert(isPresented: $loginViewModel.showAlert) {
            Alert(title: Text("Erro"), message: Text(loginViewModel.errorMessage))
        }
    }
}

#Preview {
    LoginView()
}
