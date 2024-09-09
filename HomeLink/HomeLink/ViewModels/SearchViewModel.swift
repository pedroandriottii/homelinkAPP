//
//  SearchViewModel.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    @Published var searchQuery: String = ""
    @Published var users: [User] = []
    @Published var filteredUsers: [User] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()

    init() {
        // Atualiza os resultados filtrados com base na consulta de busca
        $searchQuery
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .sink { [weak self] query in
                self?.filterUsers()
            }
            .store(in: &cancellables)
        
        fetchUsers()
    }

    // Busca todos os usuários
    func fetchUsers() {
        isLoading = true
        errorMessage = nil
        
        // Recupera o token do UserDefaults
        guard let accessToken = UserDefaults.standard.string(forKey: "accessToken") else {
            self.errorMessage = "Token de autenticação não encontrado."
            self.isLoading = false
            return
        }
        
        let headers = [
            "Authorization": "Bearer \(accessToken)"
        ]
        
        APIHelper.shared.request(
            endpoint: "/users",
            headers: headers,
            responseType: [User].self
        ) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let users):
                    self?.users = users
                    self?.filterUsers()
                case .failure(let error):
                    self?.errorMessage = error.message
                }
            }
        }
    }

    private func filterUsers() {
        if searchQuery.isEmpty {
            filteredUsers = users
        } else {
            filteredUsers = users.filter { user in
                user.name.localizedCaseInsensitiveContains(searchQuery) ||
                user.email.localizedCaseInsensitiveContains(searchQuery) ||
                user.phone.localizedCaseInsensitiveContains(searchQuery)
            }
        }
    }
}
