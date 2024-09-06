//
//  LoginViewModel.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import Foundation
import Combine

struct LoginResponse: Codable {
    let accessToken: String
}

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoading: Bool = false
    @Published var showAlert: Bool = false
    @Published var errorMessage: String = ""
    @Published var isLoggedIn: Bool = false

    private var cancellable: AnyCancellable?

    func login() {
        guard !email.isEmpty && !password.isEmpty else {
            self.errorMessage = "Email ou senha não podem estar vazios."
            self.showAlert = true
            return
        }

        self.isLoading = true
        
        let body: [String: Any] = [
            "email": email.lowercased(),
            "password": password
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: body, options: []) else {
            self.errorMessage = "Erro ao preparar dados"
            self.showAlert = true
            self.isLoading = false
            return
        }

        APIHelper.shared.request(
            endpoint: "/auth/login",
            method: "POST",
            body: jsonData,
            responseType: LoginResponse.self
        ) { result in
            DispatchQueue.main.async{
                self.isLoading = false
                switch result {
                case .success(let response):
                    UserDefaults.standard.set(response.accessToken, forKey: "accessToken")
                    self.isLoggedIn = true
                    print(response.accessToken)
                case .failure(let error) :
                        self.errorMessage = "Erro ao realizar o Login: \(error.localizedDescription)"
                        self.showAlert = true
                }
            }
        }
    }
}
