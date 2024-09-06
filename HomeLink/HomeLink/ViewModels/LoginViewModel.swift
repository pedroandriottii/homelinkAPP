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

        let emailLowercased = email.lowercased()

        guard let url = URL(string: "https://homelinkapi-production.up.railway.app/auth/login") else {
            print("URL inválida")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = [
            "email": emailLowercased,
            "password": password
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            print("Erro ao serializar o corpo da requisição: \(error)")
            return
        }

        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result -> Data in
                if let httpResponse = result.response as? HTTPURLResponse {
                    print("Código de status HTTP: \(httpResponse.statusCode)")
                    
                    guard (200...201).contains(httpResponse.statusCode) else {
                        let statusError = NSError(domain: NSURLErrorDomain, code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey : "Erro HTTP \(httpResponse.statusCode)"])
                        throw statusError
                    }
                }
                return result.data
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    print("Erro detectado: \(error)")
                    if let urlError = error as? URLError {
                        print("Erro de URL: \(urlError)")
                        self.errorMessage = urlError.localizedDescription
                    } else if let nsError = error as NSError? {
                        print("Erro HTTP detalhado: \(nsError.localizedDescription)")
                        self.errorMessage = nsError.localizedDescription
                    } else {
                        print("Erro desconhecido: \(error)")
                        self.errorMessage = error.localizedDescription
                    }
                    self.showAlert = true
                case .finished:
                    break
                }
            }, receiveValue: { data in
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Resposta JSON bruta: \(jsonString)")
                }
                do {
                    let response = try JSONDecoder().decode(LoginResponse.self, from: data)
                    UserDefaults.standard.set(response.accessToken, forKey: "accessToken")
                    self.isLoggedIn = true
                    print("Token recebido: \(response.accessToken)")
                } catch {
                    print("Erro ao decodificar JSON: \(error)")
                    self.errorMessage = "Erro ao processar resposta da API."
                    self.showAlert = true
                }
            })
    }
}
