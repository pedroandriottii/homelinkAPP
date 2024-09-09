//
//  UserCardView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import SwiftUI

struct UserCard: View {
    let user: User
    
    var body: some View {
        HStack(alignment: .center){
            Image("userPlaceholder")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.leading)
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text(user.name)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(user.email)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
                
                Text(user.phone)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.hlSeccondary)
        .cornerRadius(10)
        .shadow(radius: 5)
        
    }
}

#Preview {
    let exampleUser = User(id: "1", name: "Pedro Andriotti", email: "pedro@example.com", phone: "(81) 99999-9999")
    
    return Group {
        UserCard(user: exampleUser)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.hlBackground)
    }
}
