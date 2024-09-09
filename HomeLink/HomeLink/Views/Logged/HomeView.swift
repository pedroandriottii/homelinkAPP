//
//  HomeView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

//
//  HomeView.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 06/09/24.
//

import SwiftUI

import SwiftUI

struct HomeView: View {
    
    @State var selectedTab: Tabs = .create

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                switch selectedTab {
                case .dashboard:
                    DashboardView()
                case .search:
                    SearchView()
                case .create:
                    CreateView()
                case .profile:
                    ProfileView()
                }

                Spacer()
                Text("\(selectedTab)")
                    .foregroundStyle(.red)
                AdminTabBar(selectedTab: $selectedTab)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.hlBackground)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
