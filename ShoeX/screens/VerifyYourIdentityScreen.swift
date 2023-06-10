//
//  VerifyYourIdentityScreen.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 10/06/2023.
//

import SwiftUI

struct VerifyYourIdentityScreen: View {
    @State private var code = "";
    @State private var isCodeSent = false;
    public var phonenumber: String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>;
    
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text("Verify Your Identity")
                    .font(.custom("Teko-Regular", size: 42))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 32)
                
                Text("We’ve sent a text message to \(phonenumber)")
                    .font(.custom("Satoshi-Regular", size: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 8)
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Edit my phone")
                        .font(.custom("Satoshi-Bold", size: 14))
                        .foregroundColor(.blue)
                    
                }
                
                VStack(spacing: 0) {
                    VStack (spacing: 12) {
                        VStack {
                            TextField("000000", text: $code)
                                .font(.custom("Satoshi-Bold", size: 28))
                                .padding(.horizontal, 16)
                                .keyboardType(.phonePad)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 72)
                        .border(Color("border"), width: 1)
                    }
                    
                    
                    VStack(spacing: 12) {
                        
                        Button {
                            
                        } label: {
                            ButtonView(buttonVariant: .leading, label: "Continue")
                        }
                        
                        HStack {
                            Text("Didn't receive a code?")
                                .font(.custom("Satoshi-Regular", size: 14))
                            
                            Button {
                                isCodeSent = true
                            } label: {
                                Text("Resend")
                                    .font(.custom("Satoshi-Bold", size: 14))
                                    .foregroundColor(.blue)
                            }
                            .alert("The code has been sent to \(phonenumber)", isPresented: $isCodeSent) {
                                Button("Ok", role: .cancel){}
                            }

                        }
                        .padding(.top, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.top, 24)
                    
                }
                .padding(.vertical, 24)
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 20)
    }
}

struct VerifyYourIdentityScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerifyYourIdentityScreen(phonenumber: "63282")
    }
}
