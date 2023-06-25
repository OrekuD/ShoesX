//
//  TrendingTodayCard.swift
//  ShoeX
//
//  Created by David Opoku on 17/06/2023.
//

import SwiftUI

enum CardType {
    case wide
    case compact
}



struct TrendingTodayCard: View {
    var item: TrendingToday
    var cardType: CardType
    
    var body: some View {
        
        if cardType == .wide {
            HStack(spacing: 0) {
                Image("slide_2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 108, height: 108)
                
                VStack(spacing: 8) {
                    HStack(spacing: 0) {
                        HStack(spacing: 8) {
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(.green)
                            
                            Text("\(item.numberOfItemsSold) Sold")
                                .foregroundColor(.primary)
                                .font(.custom("Satoshi-Bold", size: 12))
                            
                        }
                        .padding(8)
                        .background(.green.opacity(0.2))
                        
                        Spacer()
                        
                        Text("$\(item.price)")
                            .font(.custom("Satoshi-Bold", size: 20))
                        
                    }
                    Text(item.name)
                        .font(.custom("Satoshi-Regular", size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)

                    Text("Men’s shoes")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)

                }
                .padding(12)
            }
            .border(Color("border"), width: 1)
        } else {
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
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.primary)
                        .lineLimit(2)

                    Spacer()
                    Text("Men’s shoes")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("$\(item.price)")
                        .font(.custom("Satoshi-Bold", size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.primary)
                }
                .padding(12)
                Spacer()
            }
            .border(Color("border"), width: 1)
        }
    }
}

struct TrendingTodayCard_Previews: PreviewProvider {
    static var previews: some View {
        TrendingTodayCard(item: .init(name: "Nike Free Terra Vista Next Nature", price: 110, numberOfItemsSold: 1203), cardType: .compact)
            .frame(height: 200)
        
        TrendingTodayCard(item: .init(name: "Nike Free Terra Vista Next Nature", price: 110, numberOfItemsSold: 1203), cardType: .compact)
            .frame(height: 200)
    }
}
