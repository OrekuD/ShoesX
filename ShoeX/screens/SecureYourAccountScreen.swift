//
//  SecureYourAccount.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 10/06/2023.
//

import SwiftUI

struct SecureYourAccountScreen: View {
    @State private var phonenumber = "";
    @State private var isCountryPickerOpen: Bool = false;
    @EnvironmentObject var viewModel: AppViewModel
    @Environment(\.colorScheme) var colorScheme
    let maxCharacterCount = 12
    
    func formatPhoneNumber(_ phoneNumber: [Character]) -> String {
        var formatted = ""
        var index = 0
        
        for character in phoneNumber {
            if index == 3 || index == 6 {
                formatted += "-"
            }
            formatted.append(character)
            
            index += 1
        }
        
        return formatted
    }
    
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
                    VStack (spacing: 12) {
                        Button {
                            withAnimation {
                                isCountryPickerOpen.toggle()
                            }
                        } label: {
                            HStack {
                                if (viewModel.country == nil) {
                                    Text("Select a country")
                                        .font(.custom("Satoshi-Medium", size: 15))
                                        .foregroundColor(.secondary)
                                } else {
                                    Text("\(viewModel.country!.flag) (\(viewModel.country!.code)) \(viewModel.country!.name)")
                                        .font(.custom("Satoshi-Medium", size: 15))
                                        .foregroundColor(.primary)
                                }
                                Spacer()
                                Image(systemName: "chevron.down")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 14, height: 14)
                                    .foregroundColor(.primary)
                                    .rotationEffect(.degrees(isCountryPickerOpen ? 180 : 0))
                            }
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .frame(height: 48)
                            .border(Color("border"), width: 1)
                        }
                        
                        VStack {
                            TextField("000-000-0000", text: $phonenumber)
                                .font(.custom("Satoshi-Bold", size: 28))
                                .padding(.horizontal, 16)
                                .onReceive(phonenumber.publisher.collect()) { characters in
                                    let filtered = characters.filter { "0123456789".contains($0) }
                                    let formatted = formatPhoneNumber(filtered)
                                    phonenumber = formatted.prefix(maxCharacterCount).trimmingCharacters(in: .whitespacesAndNewlines)
                                }
                                .keyboardType(.phonePad)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 72)
                        .border(Color("border"), width: 1)
                    }
                    
                    
                    VStack(spacing: 12) {
                        
                        NavigationLink {
                            VerifyYourIdentityScreen(phonenumber: phonenumber)
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
        .sheet(isPresented: $isCountryPickerOpen, onDismiss: {
            withAnimation {
                isCountryPickerOpen = false
            }
        }) {
            CountryPickerView(isCountryPickerOpen: $isCountryPickerOpen)
        }
    }
}

struct SecureYourAccount_Previews: PreviewProvider {
    
    static var previews: some View {
        SecureYourAccountScreen()
            .preferredColorScheme(.dark)
            .environmentObject(AppViewModel())
        
        SecureYourAccountScreen()
            .preferredColorScheme(.light)
            .environmentObject(AppViewModel())
    }
}
