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
        VStack(){
            Text("Bem vindo!")
            Spacer()
            
            NavigationLink(destination: HeroView()){
                HStack{
                    Text("Avançar")
                        .font(.title2)
                    Spacer()
                    Image(systemName: "arrow.forward")
                }
                .padding(10)
                .foregroundColor(.white)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: animate ? .leading : .trailing, endPoint: animate ? .trailing : .leading))
                .cornerRadius(7)
                .padding(40)
                .animation(.easeInOut(duration: 1.0), value: animate)
                .onAppear{
                    animate = true
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
