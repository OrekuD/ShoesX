//
//  HomeScreen.swift
//  ShoeX
//
//  Created by David Opoku on 11/06/2023.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    let screenWidth: CGFloat = UIScreen.main.bounds.width;
    let slides: [Int] = [0, 1, 2, 3, 4]
    let trendingToday: [TrendingToday] = [
        .init(name: "Nike Free Terra Vista Next Nature", price: 110, numberOfItemsSold: 5123),
        .init(name: "Nike ACG Mountain Fly Low SE", price: 170, numberOfItemsSold: 1357),
        .init(name: "Nike Air Force 1 '07 ESS", price: 210, numberOfItemsSold: 4357),
        .init(name: "Nike Air Max Dawn SE", price: 90, numberOfItemsSold: 325),
        .init(name: "Nike Wearallday", price: 300, numberOfItemsSold: 425),
    ]
    
    let recommended: [Recommended] = [
        .init(name: "Nike Free Terra Vista Next Nature", price: 120, lastPrice: 100),
        .init(name: "Nike ACG Mountain Fly Low SE", price: 140, lastPrice: 120),
        .init(name: "Nike Air Force 1 '07 ES", price: 200, lastPrice: 190),
        .init(name: "Nike Air Max Dawn SE", price: 270, lastPrice: 260),
    ]
    
    let newReleases: [NewRelease] = [
        .init(name: "Nike Air Max Dawn SEe", date: "Tomorrow"),
        .init(name: "Nike Air Force 1 '07 ESS", date: "dec 12"),
        .init(name: "Nike Wearallday", date: "dec 14"),
        .init(name: "Nike Free Terra Vista Next Nature", date: "dec 24"),
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Image("shoe-banner")
                        .resizable()
                        .scaledToFit()
                        .frame(width: screenWidth * 0.5128)
                }
                .padding(20)
                .padding(.top, safeAreaInsets.top)
                .background(Color("accent"))
                .overlay {
                    VStack{
                        HStack {
                            VStack(alignment: .leading)  {
                                Spacer()
                                Text("Black Friday\n50% off")
                                    .padding(0)
                                    .font(.custom("Teko-Regular", size: 54))
                                    .foregroundColor(.black)
                                    .padding(.bottom, 1)
                                
                                Text("Start your new year\nwith a new look")
                                    .font(.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(.black)
                                    .padding(.bottom, 16)
                                
                                Button {
                                    
                                } label: {
                                    HStack {
                                        Text("Buy & Sell")
                                            .font(.custom("Satoshi-Bold", size: 16))
                                            .foregroundColor(.white)
                                    }
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 24)
                                    .background(.black)
                                }
                                
                            }
                            Spacer()
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(slides, id: \.self) { _ in
                            VStack {
                                Image("slide_1")
                                    .resizable()
                                    .scaledToFit()
                                Spacer()
                                Text("Lifestyle")
                                    .font(.custom("Teko-Regular", size: 22))
                                    .foregroundColor(.black)
                                    .padding(.leading, 12)
                                    .padding(.bottom, 12)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .frame(width: (screenWidth - 66) / 3, height: (screenWidth - 66) / 3 * 1.657)
                            .background(.white)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 12)
                }
                .padding(.top, 20)
                
                SectionHeader(title: "Trending Today")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(trendingToday) { item in
                            TrendingTodayCard(item: item)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 12)
                }
                
                SectionHeader(title: "Packs by ShoesX")
                
                SectionHeader(title: "Recommended for You")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(recommended) { item in
                            RecommendedCard(item: item)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 12)
                }
                
                SectionHeader(title: "Release Calender")
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(newReleases) { item in
                            NewReleaseCard(item: item)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 12)
                }
                
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
    }
}


