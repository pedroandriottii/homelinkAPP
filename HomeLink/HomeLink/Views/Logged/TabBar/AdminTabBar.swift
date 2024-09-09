//
//  TabBarView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 09/09/24.
//

import SwiftUI

enum Tabs: Int {
    case dashboard = 0
    case search = 1
    case create = 2
    case profile = 3
}

struct AdminTabBar: View {
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack(alignment: .center) {
            TabBarButton(
                iconName: "chart.bar",
                selectedIconName: "chart.bar.fill",
                isSelected: selectedTab == .dashboard,
                tab: .dashboard,
                selectedTab: selectedTab,
                action: {
                    selectedTab = .dashboard
                }
            )
            
            TabBarButton(
                iconName: "magnifyingglass",
                selectedIconName: "magnifyingglass",
                isSelected: selectedTab == .search,
                tab: .search,
                selectedTab: selectedTab,
                action: {
                    selectedTab = .search
                }
            )
            
            TabBarButton(
                iconName: "plus.square",
                selectedIconName: "plus.square.fill",
                isSelected: selectedTab == .create,
                tab: .create,
                selectedTab: selectedTab,
                action: {
                    selectedTab = .create
                }
            )
            
            TabBarButton(
                iconName: "person.circle",
                selectedIconName: "person.circle.fill",
                isSelected: selectedTab == .profile,
                tab: .profile,
                selectedTab: selectedTab,
                action: {
                    selectedTab = .profile
                }
            )
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .padding(.horizontal)
        .background(.white)
    }
}


#Preview {
    AdminTabBar(selectedTab: .constant(.dashboard))
}
