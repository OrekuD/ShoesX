//
//  SectionHeader.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 11/06/2023.
//

import SwiftUI

struct SectionHeader: View {
    public var title: String;
    var body: some View {
        HStack {
            Text(title)
                .font(.custom("Satoshi-Bold", size: 22))
            Spacer()
            Text("See all")
                .font(.custom("Satoshi-Bold", size: 16))
                .foregroundColor(.blue)
            Image(systemName: "arrow.right")
                .resizable()
                .scaledToFit()
                .frame(width: 14, height: 14)
                .foregroundColor(.blue)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(title: "Release Calendar")
    }
}
