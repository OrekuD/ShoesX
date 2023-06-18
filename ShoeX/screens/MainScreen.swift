//
//  MainScreen.swift
//  ShoeX
//
//  Created by David Opoku on 10/06/2023.
//

import SwiftUI

struct TabItem: Hashable {
    var id: Int;
    var activeIcon: String;
    var inActiveIcon: String;
}

struct MainScreen: View {
    @State private var activeIndex = 0;
    
    init() {
        let transparentAppearence = UITabBarAppearance()
        transparentAppearence.configureWithTransparentBackground() // 🔑
        UITabBar.appearance().standardAppearance = transparentAppearence
    }
    
    var tabs: [TabItem] = [
        TabItem(id: 0, activeIcon: "home", inActiveIcon: "home_inactive"),
        TabItem(id: 1, activeIcon: "search", inActiveIcon: "search_inactive"),
        TabItem(id: 2, activeIcon: "notifications", inActiveIcon: "notifications_inactive"),
        TabItem(id: 3, activeIcon: "profile", inActiveIcon: "profile_inactive"),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeIndex) {
                HomeScreen()
                    .tag(0)
                SearchScreen()
                    .tag(1)
                NotificationsScreen()
                    .tag(2)
                ProfileScreen()
                    .tag(3)
            }
            VStack(spacing: 0) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("border"))
                HStack(spacing: 0) {
                    Spacer()
                    ForEach(tabs, id: \.self) { item in
                        Button {
                            activeIndex = item.id
                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                            impactMed.impactOccurred()
                        } label: {
                            Image(activeIndex == item.id ? item.activeIcon : item.inActiveIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 28, height: 28)
                                .frame(width: 70, height: 50)
                        }
                        Spacer()
                    }
                }
                .padding(.top, 12)
                .frame(maxWidth: .infinity)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
            .preferredColorScheme(.dark)
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        (UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero).insets
    }
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

extension UIEdgeInsets {
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
