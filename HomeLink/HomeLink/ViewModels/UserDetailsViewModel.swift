//
//  UserDetailsViewModel.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import Foundation
import Combine

final class UserDetailsViewModel: ObservableObject {
    @Published var user: User? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private var cancellables = Set<AnyCancellable>()
    
    func fetchUserDetails(userId: String) {
        isLoading = true
        errorMessage = nil
        
        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else {
            self.errorMessage = "Token de autenticação não encontrado."
            self.isLoading = false
            return
        }
        
        let headers = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        APIHelper.shared.request(
            endpoint: "/users/\(userId)",
            headers: headers,
            responseType: User.self
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let user):
                    self?.user = user
                case .failure(let error):
                    self?.errorMessage = error.message
                }
            }
        }
    }
}
