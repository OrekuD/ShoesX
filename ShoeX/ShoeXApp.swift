//
//  ShoeXApp.swift
//  ShoeX
//
//  Created by David Opoku on 10/06/2023.
//

import SwiftUI

@main
struct ShoeXApp: App {
    @StateObject var appViewModel: AppViewModel = AppViewModel();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(.black)
                .environmentObject(appViewModel)
//                .environment(\.colorScheme, .light)
        }
    }
}
