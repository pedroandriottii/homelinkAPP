//
//  AlertDialog.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

struct AlertDialog: View {
    let message: String
    
    var body: some View {
        HStack(){
            Image(systemName: "exclamationmark.triangle")
            Text(message)
            Spacer()
        }
        .bold()
        .foregroundColor(.red)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red.opacity(0.4))
        .cornerRadius(10)
            
    }
}

#Preview {
    AlertDialog(message: "OI")
}
