//
//  CustomSecureField.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var password: String
    var placeholder: String
    var placeholderColor: Color = .gray
    var backgroundColor: Color = .hlSeccondary

    var body: some View {
        ZStack(alignment: .leading) {
            if password.isEmpty {
                Text(placeholder)
                    .foregroundColor(placeholderColor)
                    .padding(.leading, 16)
                    .zIndex(1)
            }
            SecureField("", text: $password)
                .padding(16)
                .background(backgroundColor)
                .cornerRadius(12)
                .zIndex(0)
        }
        .frame(height: 50)
    }
}
