//
//  HomeScreen.swift
//  ShoeX
//
//  Created by David Opoku on 11/06/2023.
//

import SwiftUI

enum Screens {
    case trending
    case recommended
    case releases
}

struct HomeScreen: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    let screenWidth: CGFloat = UIScreen.main.bounds.width;
    @State private var navigationPath: [Screens] = []
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
    
    let addidas: [NewRelease] = [
        .init(name: "Nike Free Terra Vista Next Nature", date: "dec 24"),
        .init(name: "Nike Air Max Dawn SEe", date: "Tomorrow"),
        .init(name: "Nike Air Force 1 '07 ESS", date: "dec 12"),
        .init(name: "Nike Wearallday", date: "dec 14"),
        .init(name: "Nike Free Terra Vista Next Nature", date: "dec 24"),
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: ((UIScreen.main.bounds.width - 40) / 2) - 10)),
        GridItem(.adaptive(minimum: ((UIScreen.main.bounds.width - 40) / 2) - 10)),
    ]
    
    func goToTrending() {
        navigationPath.append(Screens.trending)
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Image("home_banner_1")
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
                                    Text("Buy & Sell")
                                        .font(.custom("Satoshi-Bold", size: 16))
                                        .foregroundColor(.white)
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
                
                Group {
                    SectionHeader(title: "Trending Today", screen: .trending)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(trendingToday) { item in
                                TrendingTodayCard(item: item)
                                    .frame(width: (screenWidth - 100) / 2)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 12)
                    }
                }
                
                Image("home_banner_2")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .overlay {
                        VStack(spacing: 0) {
                            Spacer()
                            Text("Start your life\nwith a Nike Sneaker")
                                .font(.custom("Teko-Regular", size: 52))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.trailing)
                                .padding(.trailing, 20)
                                .padding(.bottom, 16)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            Text("Shop over 400 colorways")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.trailing)
                                .padding(.trailing, 20)
                                .padding(.bottom, 24)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            Button {
                                
                            } label: {
                                Text("Shop Now")
                                    .font(.custom("Satoshi-Bold", size: 16))
                                    .foregroundColor(.white)
                                    .padding(.vertical, 12)
                                    .padding(.horizontal, 24)
                                    .background(.black)
                                    .padding(.trailing, 20)
                            }
                            .padding(.bottom, 24)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            
                        }
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 24)
                
                Group {
                    SectionHeader(title: "Recommended for You", screen: .recommended)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(recommended) { item in
                                RecommendedCard(item: item)
                                    .frame(width: (screenWidth - 100) / 2)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 12)
                    }
                    
                }
                
                Group {
                    SectionHeader(title: "Release Calender", screen: .releases)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(newReleases) { item in
                                NewReleaseCard(item: item)
                                    .frame(width: (screenWidth - 100) / 2)
                            }
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 12)
                    }
                }
                
                
                Image("home_banner_3")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .overlay {
                        VStack(spacing: 0) {
                            Spacer()
                            Text("Sneaker Collections")
                                .font(.custom("Teko-Regular", size: 52))
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 20)
                            
                            HStack {
                                Button {
                                    
                                } label: {
                                    Text("See all collections")
                                        .font(.custom("Satoshi-Bold", size: 16))
                                        .foregroundColor(.black)
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 24)
                                        .background(.white)
                                        .padding(.leading, 20)
                                        .padding(.bottom, 20)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                    .padding(.top, 32)
                    .padding(.bottom, 24)
                    .padding(.horizontal, 20)
                
                Group {
                    Image("addidas_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color("brand_background_color"))
                        .padding(.bottom, 12)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(addidas) { item in
                            NewReleaseCard(item: item)
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                Group {
                    Image("nike_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64, height: 64)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Color("brand_background_color"))
                        .padding(.bottom, 12)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(addidas) { item in
                            NewReleaseCard(item: item)
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        }
        .ignoresSafeArea()
    }
    
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
        HomeScreen()
            .preferredColorScheme(.light)
    }
}


