//
//  TrendingTodayCard.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 17/06/2023.
//

import SwiftUI

struct TrendingToday: Identifiable {
    let id: UUID = .init()
    var name: String
    var price: Int
    var numberOfItemsSold: Int
}

struct TrendingTodayCard: View {
    public var item: TrendingToday
    
    var body: some View {
        VStack(spacing: 0) {
            Image("slide_2")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(1/1, contentMode: .fill)
                .overlay {
                    HStack(spacing: 8) {
                        Circle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(.green)
                        
                        Text("\(item.numberOfItemsSold) Sold")
                            .foregroundColor(.black)
                            .font(.custom("Satoshi-Bold", size: 12))
                        
                    }
                    .padding(8)
                    .background(.white)
                    .padding(8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                }
            VStack(spacing: 8) {
                Text(item.name)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()
                Text("Men’s shoes")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text("$\(item.price)")
                    .font(.custom("Satoshi-Bold", size: 20))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(12)
            Spacer()
        }
        .border(Color("border"), width: 1)
    }
}

struct TrendingTodayCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendingTodayCard(item: .init(name: "Nike Free Terra Vista Next Nature", price: 110, numberOfItemsSold: 1203))
            .frame(height: 200)
    }
}
