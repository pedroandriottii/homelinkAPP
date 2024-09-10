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
        NavigationLink(destination: UserDetailsView(userId: user.id)){
            HStack(alignment: .center){
                CircleImage(image: Image("userPlaceholder"))
                    .padding(.trailing)
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
}
