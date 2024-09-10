//
//  ProfileView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var showPurpleCard: Bool = false
    var body: some View {
        VStack{
            GlassCard(userName: "Pedro Andriotti", userMail: "pedrohandriotti@gmail.com", userPhone: "819888145903", amazonMail: "pedroandriotti@homelinkbr.com", amazonPassword: "Teste", showPurpleCard: $showPurpleCard)
                .padding(.top)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.hlBackground)
        
        
    }
}

#Preview {
    ProfileView()
}
