//
//  ContentView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    let imageNames = ["hero1"]
    var body: some View {
        VStack(alignment: .center){
            TabView {
                ForEach(imageNames, id: \.self) { imageName in
//                    Image(imageName)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(height: 500)
//                        .frame(width: 200)
//                        .clipped()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(height: 250)
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
