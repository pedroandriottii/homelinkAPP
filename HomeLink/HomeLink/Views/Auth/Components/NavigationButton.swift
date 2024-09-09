//
//  NavigationButton.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import SwiftUI

struct NavigationButton: View {
    var title: String
    var destination: AnyView
    var isFilled: Bool = true
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.title2)
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(isFilled ? Color.hlBlue : Color.clear)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isFilled ? Color.clear : Color.white, lineWidth: 2)
                )
                .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
