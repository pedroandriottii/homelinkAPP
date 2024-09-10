//
//  UserDetails.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import SwiftUI

struct UserDetailsView: View {
    @StateObject private var viewModel = UserDetailsViewModel()
    let userId: String

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Carregando detalhes...")
                    .padding()
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.hlBackground)
                    
            } else if let errorMessage = viewModel.errorMessage {
                Text("Erro: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else if let user = viewModel.user {
                ScrollView {
                    Rectangle()
                        .foregroundColor(Color.blue)
                        .frame(height: 300)
                    CircleImage(image: Image("userPlaceholder"))
                        .offset(y: -130)
                        .padding(.bottom, -130)
                VStack(alignment: .leading) {
                    HStack{
                        VStack(alignment: .leading, spacing: 4){
                            Text("\(user.name)")
                                .font(.title2)
                                .foregroundColor(.white)
                            
                            Text("\(user.email)")
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        Image(systemName: "pencil")
                            .foregroundColor(.gray)
                    }
                    
                    Text("Telefone: \(user.phone)")
                        .font(.body)
                        .foregroundColor(.secondary)
                   
                    Text("Email Amazon: \(user.amazonMail ?? "Não Informado")")
                        .font(.body)
                        .foregroundColor(.secondary)

                    Text("Senha Amazon: \(user.amazonPassword ?? "Não Informado")")
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                }
                .navigationTitle("Detalhes do Usuário")
                .navigationBarTitleDisplayMode(.inline)
                .frame(maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                .background(Color.hlBackground)
                
            }
        }
        .onAppear {
            viewModel.fetchUserDetails(userId: userId)
        }
    }
}

#Preview {
    UserDetailsView(userId: "ca841b74-fb32-4929-a9b9-4a3441afcbeb")
}
