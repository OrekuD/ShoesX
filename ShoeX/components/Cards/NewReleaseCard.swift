//
//  NewReleaseCard.swift
//  ShoeX
//
//  Created by David Opoku on 18/06/2023.
//

import SwiftUI


struct NewReleaseCard: View {
    public var item: NewRelease;
    
    var body: some View {
        VStack(spacing: 0) {
            Image("slide_2")
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(1/1, contentMode: .fill)
                .overlay {
                    HStack {
                        Text("\(item.date)")
                            .foregroundColor(.white)
                            .font(.custom("Teko-Regular", size: 20))
                            .textCase(.uppercase)
                        
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(.black)
                    .padding(8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    
                }
            VStack(spacing: 8) {
                Text(item.name)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
                Spacer()
                Text("Men’s shoes")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button {
                    
                } label: {
                    Text("Place bid")
                        .font(.custom("Satoshi-Bold", size: 18))
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .border(.primary)
                        .foregroundColor(.primary)
                }
                
            }
            .padding(12)
            Spacer()
        }
        .border(Color("border"), width: 1)
    }
}

struct NewReleaseCard_Previews: PreviewProvider {
    static var previews: some View {
        NewReleaseCard(item: .init(name: "Test", date: "tomorrow"))
            .frame(height: 300)
            .preferredColorScheme(.dark)
    }
}
