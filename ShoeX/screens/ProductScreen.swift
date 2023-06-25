//
//  ProductScreen.swift
//  ShoeX
//
//  Created by David Opoku on 24/06/2023.
//

import SwiftUI

struct ProductDetail: Identifiable {
    let id = UUID()
    var label: String
    var value: String
}

struct ProductScreen: View {
    @State private var showMore: Bool = false;
    @EnvironmentObject private var appModel: AppViewModel;
    @Environment(\.presentationMode) private var presentationMode;
    
    let screenWidth = UIScreen.main.bounds.width
    
    let productDetails: [ProductDetail] = [
        .init(label: "Style", value: "FN20182"),
        .init(label: "Colorway", value: "Bone"),
        .init(label: "Retail Price", value: "$60"),
        .init(label: "Release Date", value: "08/12/2022"),
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundColor(.primary)
                }
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundColor(.primary)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 12)
            
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("border"))
            ScrollView {
                VStack {
                    Group {
                        Image("product")
                            .resizable()
                            .scaledToFit()
                        Text("Nike Free Terra Vista Next Nature")
                            .font(.custom("Satoshi-Bold", size: 34))
                            .padding(.bottom, 2)
                        Text("Men’s shoes size M  •  2022 Restock")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        Text("⚡ Selling Fast with 5,113 Sold")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color("green"))
                        
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("View Product")
                                .font(.custom("Satoshi-Bold", size: 16))
                            Image(systemName: "arrow.up.right")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 12)
                        }
                    }
                    .padding(.vertical, 12)
                    
                    Text("Product Detail")
                        .font(.custom("Satoshi-Bold", size: 18))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 12)
                    
                    ForEach(productDetails) {productDetail in
                        VStack(spacing: 0) {
                            HStack {
                                Text(productDetail.label)
                                    .font(.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text(productDetail.value)
                                    .font(.custom("Satoshi-Medium", size: 16))
                            }
                            .padding(.top, 4)
                            .padding(.bottom, 12)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color("border"))
                        }
                    }
                    
                    Group {
                        Text("The Nike Free Trail Vista is a rugged sneaker that doubles as a trail shoe. Whether you’re getting it for everyday life or an outdoor adventure, it can easily handle both! Especially in the colder months or if it gets snowy, it’s got the warmth and traction to keep you comfortable. This shoe nails style, comfort, and function without compromising either, which has made it a welcome addition to many people’s daily rotation.")
                            .font(.custom("Satoshi-Medium", size: 16))
                            .padding(.bottom, 6)
                            .lineLimit(showMore ? 100 : 4)
                            .padding(.top, 12)
                        
                        Button {
                            showMore.toggle()
                        } label: {
                            Text(showMore ? "Show Less" : "Show More")
                                .font(.custom("Satoshi-Bold", size: 16))
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image("verified_by_shoesx")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .overlay {
                            VStack(spacing: 0) {
                                Spacer()
                                Text("Verified by ShoesX")
                                    .font(.custom("Teko-Regular", size: 52))
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 10)
                                
                                Text("3,000+ shoes verified. Every Time")
                                    .font(.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 20)
                                
                                Button {
                                    
                                } label: {
                                    Text("Shop Now")
                                        .font(.custom("Satoshi-Bold", size: 16))
                                        .foregroundColor(.white)
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 24)
                                        .background(.black)
                                        .padding(.leading, 20)
                                        .padding(.bottom, 20)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                        .padding(.top, 12)
                    
                    Group {
                        Text("Related Products")
                            .font(.custom("Satoshi-Bold", size: 24))
                            .padding(.top, 12)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(appModel.trendingItems) { item in
                                    TrendingTodayCard(item: item, cardType: .compact)
                                        .frame(width: (screenWidth - 100) / 2 )
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding(20)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color("border"))
                HStack(spacing: 10) {
                    Button {
                        
                    } label: {
                        VStack(spacing: 8) {
                            Text("$208")
                                .font(.custom("Satoshi-Bold", size: 20))
                                .foregroundColor(.white)
                            Text("Sell or Ask")
                                .font(.custom("Satoshi-Medium", size: 16))
                                .foregroundColor(.white)
                        }
                        .frame(width: (screenWidth - 50) / 2, height: 80)
                        .background(Color("pink"))
                    }
                    Button {
                        
                    } label: {
                        VStack(spacing: 8) {
                            Text("$200")
                                .font(.custom("Satoshi-Bold", size: 20))
                                .foregroundColor(.white)
                            Text("Sell or Bid")
                                .font(.custom("Satoshi-Medium", size: 16))
                                .foregroundColor(.white)
                        }
                        .frame(width: (screenWidth - 50) / 2, height: 80)
                        .background(Color("blue"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ProductScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductScreen()
            .preferredColorScheme(.dark)
            .environmentObject(AppViewModel())
    }
}
