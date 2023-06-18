//
//  RecommendedCard.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 17/06/2023.
//

import SwiftUI

struct Recommended: Identifiable {
    let id: UUID = .init()
    var name: String
    var price: Int
    var lastPrice: Int
}

struct RecommendedCard: View {
    let screenWidth: CGFloat = UIScreen.main.bounds.width;
    public var item: Recommended
    
    var body: some View {
        VStack(spacing: 0) {
            Image("slide_2")
                .resizable()
                .scaledToFill()
                .frame(width: (screenWidth - 100) / 2, height: (screenWidth - 100) / 2)
            
            VStack(spacing: 6) {
                Text(item.name)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Men’s shoes")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("$\(item.price)")
                    .font(.custom("Satoshi-Bold", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 0) {
                    Text("Last price: $\(item.lastPrice)")
                        .foregroundColor(.white)
                        .font(.custom("Satoshi-Regular", size: 12))
                    
                }
                .padding(8)
                .background(Color("green"))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(12)
        }
        .frame(width: (screenWidth - 100) / 2)
        .border(Color("border"), width: 1)
    }
}

struct RecommendedCard_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedCard(item: .init(name: "Nike Air Max Dawn", price: 260, lastPrice: 250))
            .frame(height: 200)
    }
}
