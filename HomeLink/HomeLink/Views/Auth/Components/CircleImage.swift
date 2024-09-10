//
//  CircleImage.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 10/09/24.
//

import SwiftUI

struct CircleImage: View {
    
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .clipShape(Circle())
            .frame(width: 60, height: 60)
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("userPlaceholder"))
}
