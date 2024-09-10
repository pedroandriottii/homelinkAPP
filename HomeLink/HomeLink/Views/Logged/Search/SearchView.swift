//
//  SearchView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()

    var body: some View {
        VStack {
            CustomField(object: $viewModel.searchQuery, placeholder: "Buscar por nome, telefone ou email", isSecure: false)
                .padding()

            if viewModel.isLoading {
                ProgressView("Carregando...")
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Erro: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(viewModel.filteredUsers) { user in
                            UserCard(user: user)
                        }
                    }
                    .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.hlBackground)
    }
}


#Preview {
    SearchView()
}
