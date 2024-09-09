//
//  CustomSecureField.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

struct CustomField: View {
    @Binding var object: String
    var placeholder: String
    var isSecure: Bool = false

    var body: some View {
        ZStack(alignment: .leading) {
            if object.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(.leading, 16)
                    .zIndex(1)
            }
            if isSecure {
                SecureField("", text: $object)
                    .padding(16)
                    .background(Color.hlSeccondary)
                    .cornerRadius(12)
                    .zIndex(0)
            } else {
                TextField("", text: $object)
                    .padding(16)
                    .background(Color.hlSeccondary)
                    .cornerRadius(12)
                    .zIndex(0)
            }
        }
        .foregroundColor(.white)
        .frame(height: 50)
    }
}

#Preview {
    @State var testInput = ""
    @State var passwordInput = ""
    
    return Group{
        CustomField(object: $testInput, placeholder: "Nome", isSecure: false)
        CustomField(object: $passwordInput, placeholder: "******", isSecure: true)
    }
    
}
