//
//  SectionHeader.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 11/06/2023.
//

import SwiftUI

struct SectionHeader: View {
    var title: String;
    var screen: Screens
    
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Satoshi-Bold", size: 22))
            Spacer()
            NavigationLink {
                switch screen {
                case .trending:
                    TrendingTodayScreen()
                        .navigationBarBackButtonHidden()
                case .releases:
                    NewReleasesScreen()
                        .navigationBarBackButtonHidden()
                case .recommended:
                    RecommendedScreen()
                        .navigationBarBackButtonHidden()
                }
            } label: {
                Text("See all")
                    .font(.custom("Satoshi-Bold", size: 16))
                    .foregroundColor(.blue)
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundColor(.blue)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
    }
}

//struct SectionHeader_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionHeader(title: "Release Calendar")
//    }
//}
