//
//  TextInput.swift
//  ShoeX
//
//  Created by David Opoku on 10/06/2023.
//

import SwiftUI

struct TextInput: View {
    @State var value = "";
    var label = "";
    var placeholder = "";
    var isPasswordField = false;
    
    var body: some View {
        VStack(spacing: 0) {
            Text(label)
                .font(.custom("Satoshi-Regular", size: 13))
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            if isPasswordField {
                SecureField(placeholder, text: $value)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .frame(height: 26)
            } else {
                TextField(placeholder, text: $value)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .frame(height: 26)
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
        .frame(height: 64)
        .border(Color("border"), width: 1)
        .padding(.bottom, 12)
    }
}
