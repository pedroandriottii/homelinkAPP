//
//  HeroView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

struct HeroView: View {
    @State private var isActive: Bool = false
    @State private var fadeOut: Bool = false

    var body: some View {
        VStack {
            if isActive {
                LoginView()
            } else {
                VStack(){
                    Spacer()
                    Image("hlTextLogo")
                    Text("SEU CONFORTO ESTÁ AQUI")
                        .foregroundColor(.white)
                        .bold()
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.hlBackground)
                .opacity(fadeOut ? 0 : 1)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                        withAnimation(.easeInOut(duration: 1.0)){
                            self.fadeOut = true
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        self.isActive = true
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.hlBackground)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HeroView()
}
