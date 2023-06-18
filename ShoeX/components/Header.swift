//
//  Header.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 18/06/2023.
//

import SwiftUI

struct Header: View {
    var title: String;
    var hasCheckButton: Bool
    
    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Text(title)
                    .font(.custom("Satoshi-Bold", size: 32))
                Spacer()
                
                if hasCheckButton {
                    Button {
                        
                    } label: {
                        Image("double_checkmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                    }
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 20)
            Rectangle()
                .frame(width: .infinity, height: 1)
                .foregroundColor(Color("border"))
        }
        .frame(maxWidth: .infinity)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Notifications", hasCheckButton: true)
    }
}
