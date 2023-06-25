//
//  RecommendedScreen.swift
//  ShoeX
//
//  Created by David Opoku on 18/06/2023.
//

import SwiftUI

struct RecommendedScreen: View {
    
    let recommended: [Recommended] = [
        .init(name: "Nike Free Terra Vista Next Nature", price: 120, lastPrice: 100),
        .init(name: "Nike ACG Mountain Fly Low SE", price: 140, lastPrice: 120),
        .init(name: "Nike Air Force 1 '07 ES", price: 200, lastPrice: 190),
        .init(name: "Nike Air Max Dawn SE", price: 270, lastPrice: 260),
    ]
    
    
    let columns = [
        GridItem(.adaptive(minimum: ((UIScreen.main.bounds.width - 40) / 2) - 10)),
        GridItem(.adaptive(minimum: ((UIScreen.main.bounds.width - 40) / 2) - 10)),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            CategoryHeader(title: "Recommended")
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(recommended) { item in
                        RecommendedCard(item: item)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct RecommendedScreen_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedScreen()
    }
}
