//
//  NewReleasesScreen.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 18/06/2023.
//

import SwiftUI

struct NewReleasesScreen: View {
    let columns = [
        GridItem(.adaptive(minimum: ((UIScreen.main.bounds.width - 40) / 2) - 10)),
        GridItem(.adaptive(minimum: ((UIScreen.main.bounds.width - 40) / 2) - 10)),
    ]
    
    let items: [NewRelease] = [
        .init(name: "Nike Air Max Dawn SEe", date: "Tomorrow"),
        .init(name: "Nike Air Force 1 '07 ESS", date: "dec 12"),
        .init(name: "Nike Wearallday", date: "dec 14"),
        .init(name: "Nike Free Terra Vista Next Nature", date: "dec 24"),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            CategoryHeader(title: "New Releases")
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(items) { item in
                        NewReleaseCard(item: item)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct NewReleasesScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewReleasesScreen()
    }
}
