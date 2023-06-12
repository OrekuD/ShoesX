//
//  HomeScreen.swift
//  ShoeX
//
//  Created by David Opoku on 11/06/2023.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    var screenWidth: CGFloat = UIScreen.main.bounds.width;
    var slides: [Int] = [0, 1, 2, 3, 4]
    
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
                        ForEach(slides, id: \.self) { _ in
                            VStack {
                                Image("slide_2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: (screenWidth - 100) / 2)
                                
                                Spacer()
                                VStack {
                                    Text("Nike Free Terra Vista Next Nature")
                                        .font(.custom("Satoshi-Regular", size: 16))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.bottom, 2)
                                    
                                    Text("Men’s shoes")
                                        .font(.custom("Satoshi-Regular", size: 16))
                                        .foregroundColor(.secondary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.bottom, 2)
                                    
                                    Text("$100")
                                        .font(.custom("Satoshi-Bold", size: 20))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .padding(12)
                            }
                            .padding(.top, 8)
                            .frame(width: (screenWidth - 100) / 2, height: (screenWidth - 100) / 2 * 1.76)
                            .border(Color("border"), width: 1)
//                            .background(.red)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 12)
                }
                
                SectionHeader(title: "Packs by ShoesX")
                
                SectionHeader(title: "Recommended for You")
                
                SectionHeader(title: "Release Calender")
                
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


