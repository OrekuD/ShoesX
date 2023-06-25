//
//  SearchScreen.swift
//  ShoeX
//
//  Created by David Opoku on 11/06/2023.
//

import SwiftUI

struct SearchScreen: View {
    @State var searchQuery: String = "";
    @State var isGridView: Bool = true;
    @State var selectedCategory: String = "";
    @Environment(\.colorScheme) var colorScheme
    
    let categories: [String] = [
        "Lifestyle", "Jordan", "Running", "Basketball", "Football", "Training & Gym",
        "Training & Gym", "Golf", "Tennis", "Walking"
    ]
    
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
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.secondary)
                TextField("Search by name, brand", text: $searchQuery)
                    .font(.custom("Satoshi-Bold", size: 16))
                
                Button {
                    isGridView = true
                } label: {
                    Image(systemName: "square.grid.2x2.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(isGridView ? .primary : .secondary)
                        .padding(2)
                }
                
                Button {
                    isGridView = false
                } label: {
                    Image(systemName: "list.bullet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 34, height: 28)
                        .foregroundColor(isGridView ? .secondary : .primary)
                        .padding(2)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 6)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(categories, id: \.self) {item in
                        Button {
                            selectedCategory = item
                        } label: {
                            Text(item)
                                .font(.custom("Satoshi-Bold", size: 14))
                                .foregroundColor(selectedCategory == item ? colorScheme == .dark ? .black : .white : .primary.opacity(0.4))
                                .padding(.horizontal, 18)
                                .frame(height: 34)
                                .background(
                                    colorScheme == .dark ?
                                        selectedCategory == item ? .white : .white.opacity(0.15)
                                    : selectedCategory == item ? .black  : .black.opacity(0.05))
                            
                                .cornerRadius(17)
                        }
                    }
                }
                .padding(.top, 16)
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
            }
            
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .foregroundColor(Color("border"))
            ScrollView {
                if isGridView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(trendingToday) {item in
                            TrendingTodayCard(item: item, cardType: .compact)
                        }
                    }
                    .padding(20)
                } else {
                    VStack(spacing: 10) {
                        ForEach(trendingToday) { item in
                            TrendingTodayCard(item: item, cardType: .wide)
                        }
                    }
                    .padding(20)
                }
            }
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
            .preferredColorScheme(.dark)
        SearchScreen()
            .preferredColorScheme(.light)
    }
}
