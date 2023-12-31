//
//  OutlinedButtonView.swift
//  ShoeX
//
//  Created by David Opoku on 10/06/2023.
//

import SwiftUI

struct OutlinedButton: View {
    @Environment(\.colorScheme) private var colorScheme;
    var label: String
    var iconName: String = ""
    var isSystemImage: Bool = false
    var isRightIconHidden: Bool = true
    
    init(label: String, iconName: String, isSystemImage: Bool) {
        self.label = label
        self.iconName = iconName
        self.isSystemImage = isSystemImage
        self.isRightIconHidden = false
    }

    init(label: String) {
        self.label = label
    }

    var body: some View {
        HStack {
                Text(label)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .font(.custom("Satoshi-Bold", size: 18))
                Spacer()
            if isSystemImage && !isRightIconHidden {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
            } else {
                Image(iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
            }
            
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .frame(height: 64)
        .border(colorScheme == .dark ? .white : .black, width: 1)
    }
}

struct OutlinedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            OutlinedButton(label: "ok", iconName: "google", isSystemImage: false)
        }
        .padding(.horizontal, 20)
    }
}
