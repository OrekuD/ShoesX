//
//  ButtonView.swift
//  ShoeX
//
//  Created by David Opoku on 10/06/2023.
//

import SwiftUI

enum ButtonViewVariant {
    case leading
    case center
}

struct ButtonView: View {
    @Environment(\.colorScheme) private var colorScheme;
    var buttonVariant: ButtonViewVariant = .leading
    var label: String
    var textColor: Color = .black
    var backgroundColor: Color = .white
    
    init(buttonVariant: ButtonViewVariant, label: String) {
        self.buttonVariant = buttonVariant
        self.label = label
    }
    
    init(buttonVariant: ButtonViewVariant, label: String, textColor: Color, backgroundColor: Color) {
        self.buttonVariant = buttonVariant
        self.label = label
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        HStack {
            if buttonVariant == .leading {
                Text(label)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .font(.custom("Satoshi-Bold", size: 18))
                Spacer()
                Image(systemName: "arrow.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                
            } else {
                Text(label)
                    .foregroundColor(textColor)
                    .font(.custom("Satoshi-Bold", size: 18))
            }
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
        .frame(height: 64)
        .background(buttonVariant == .leading ? colorScheme == .dark ? .white : .black : backgroundColor)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(buttonVariant: .leading, label: "Log In")
                .preferredColorScheme(.dark)
            
        }
        .padding(.horizontal, 20)
    }
}
