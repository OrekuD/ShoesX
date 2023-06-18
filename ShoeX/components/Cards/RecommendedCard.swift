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
    public var item: Recommended
    
    var body: some View {
        VStack(spacing: 0) {
            Image("slide_2")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(1/1, contentMode: .fill)
//                .overlay {
//                    HStack(spacing: 8) {
//                        Circle()
//                            .frame(width: 8, height: 8)
//                            .foregroundColor(.green)
//                        
//                        Text("h Sold")
//                            .foregroundColor(.black)
//                            .font(.custom("Satoshi-Bold", size: 12))
//                        
//                    }
//                    .padding(8)
//                    .background(.white)
//                    .padding(8)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
//                }
            
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
                
                Text("Last price: $\(item.lastPrice)")
                    .foregroundColor(.white)
                    .font(.custom("Satoshi-Regular", size: 12))
                    .padding(8)
                    .background(Color("green"))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(12)
            Spacer()
        }
        .border(Color("border"), width: 1)
    }
}

struct RecommendedCard_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedCard(item: .init(name: "Nike Air Max Dawn", price: 260, lastPrice: 250))
            .frame(width: 200, height: 200)
    }
}
