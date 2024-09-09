//
//  TabBarButton.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import SwiftUI

struct TabBarButton: View {
    var iconName: String
    var selectedIconName: String
    var isSelected: Bool
    var tab: Tabs
    var selectedTab: Tabs
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            GeometryReader { geo in
                VStack {
                    Image(systemName: isSelected ? selectedIconName : iconName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                .foregroundColor(.black)
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}
