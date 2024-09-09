//
//  ContentView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    var body: some View {
        VStack(alignment: .center){
            Text("Bem vindo!")
            Spacer()
            VStack(alignment: .center) {
                NavigationButton(
                    title: "Login",
                    destination: AnyView(HeroView()),
                    isFilled: true
                )
                .padding(.bottom)
                
                NavigationButton(
                    title: "Cadastre-se",
                    destination: AnyView(SignupView()),
                    isFilled: false
                )
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(40)
        }.background(.hlBackground)
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
