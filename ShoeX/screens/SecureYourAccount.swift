//
//  SecureYourAccount.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 10/06/2023.
//

import SwiftUI

struct SecureYourAccount: View {
    @State private var phonenumber = "";
    @State private var isCountryPickerOpen: Bool = false;
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Secure Your Account")
                    .font(.custom("Teko-Regular", size: 42))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 32)
                
                Text("Enter your phone number below. An SMS will be sent that number with a code to enter on the next screen.")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 8)
                
                VStack(spacing: 0) {
                    TextInput(value: phonenumber, label: "Phonenumber", placeholder: "*********")
                    
                    VStack(spacing: 12) {
                       
                        Button {
                            
                        } label: {
                            ButtonView(buttonVariant: .leading, label: "Continue")
                        }
                        
                        OutlinedButtonView(
                            label: "Maybe Later"
                        )
                        
                    }
                    .padding(.top, 32)
                    
                }
                .padding(.vertical, 24)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}

struct SecureYourAccount_Previews: PreviewProvider {
    static var previews: some View {
        SecureYourAccount()
            .preferredColorScheme(.dark)
        
        SecureYourAccount()
            .preferredColorScheme(.light)
    }
}
