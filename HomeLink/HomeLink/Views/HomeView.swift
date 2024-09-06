//
//  HomeView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            Text("Bem vindo")
                .padding()
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.hlBackground)
        .ignoresSafeArea(.all)
    }
}

#Preview {
    HomeView()
}
