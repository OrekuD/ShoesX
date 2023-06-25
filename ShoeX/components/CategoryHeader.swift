//
//  Header.swift
//  ShoeX
//
//  Created by David Opoku on 18/06/2023.
//

import SwiftUI

struct CategoryHeader: View {
    public var title: String
    @Environment(\.presentationMode) private var presentationMode
   
    
    var body: some View {
        VStack(spacing: 16) {
            Text(title)
                .font(.custom("Satoshi-Bold", size: 20))
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 1)
                .foregroundColor(Color("border"))
        }
        .padding(.top, 16)
        .overlay {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "arrow.backward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .foregroundColor(.primary)
            }
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CategoryHeader_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHeader(title: "Testing")
            .preferredColorScheme(.dark)
    }
}
