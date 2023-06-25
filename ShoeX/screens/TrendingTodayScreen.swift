//
//  TrendingTodayScreen.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 18/06/2023.
//

import SwiftUI

struct TrendingTodayScreen: View {
    
    let columns = [
        GridItem(.adaptive(minimum: ((UIScreen.main.bounds.width - 40) / 2) - 10)),
        GridItem(.adaptive(minimum: ((UIScreen.main.bounds.width - 40) / 2) - 10)),
    ]
    
    let trendingToday: [TrendingToday] = [
        .init(name: "Nike Free Terra Vista Next Nature", price: 110, numberOfItemsSold: 5123),
        .init(name: "Nike ACG Mountain Fly Low SE", price: 170, numberOfItemsSold: 1357),
        .init(name: "Nike Air Force 1 '07 ESS", price: 210, numberOfItemsSold: 4357),
        .init(name: "Nike Air Max Dawn SE", price: 90, numberOfItemsSold: 325),
        .init(name: "Nike Wearallday", price: 300, numberOfItemsSold: 425),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            CategoryHeader(title: "Trending Today")
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(trendingToday) { item in
                        TrendingTodayCard(item: item, cardType: .compact)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct TrendingTodayScreen_Previews: PreviewProvider {
    static var previews: some View {
        TrendingTodayScreen()
            .preferredColorScheme(.dark)
    }
}
