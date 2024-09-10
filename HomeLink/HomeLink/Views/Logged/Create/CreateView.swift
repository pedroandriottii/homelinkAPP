//
//  CreateView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Criar")
                .foregroundStyle(.white)
                .font(.title)
            VStack(spacing: 0) {
                Image("hero1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                Text("Novo Orçamento")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.hlBlue)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .background(Color.hlBlue)
            .cornerRadius(7)
            .shadow(radius: 5)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.hlBackground)
    }
}

#Preview {
    CreateView()
}
