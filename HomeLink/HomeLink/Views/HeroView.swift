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
                Text("HOME LINK")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .opacity(fadeOut ? 0 : 1)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                            withAnimation(.easeInOut(duration: 1.0)){
                                self.fadeOut = true
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.isActive = true
                        }
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HeroView()
}
