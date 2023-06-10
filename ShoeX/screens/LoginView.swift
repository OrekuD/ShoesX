//
//  LoginView.swift
//  ShoeX
//
//  Created by David Opoku on 10/06/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Welcome back!")
                        .font(.custom("Teko-Regular", size: 42))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 32)
                    
                    Text("Manager your Bids, Sells & More")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 8)
                    
                    VStack(spacing: 0) {
                        TextInput(value: email, label: "Email address", placeholder: "Please enter your email")
                        TextInput(value: password, label: "Password", placeholder: "*********", isPasswordField: true)
                        
                        Button {
                            
                        } label: {
                            Text("Forgot Password")
                                .font(.custom("Satoshi-Bold", size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.top, 4)
                        
                        VStack(spacing: 12) {
                           
                            Button {
                                
                            } label: {
                                ButtonView(buttonVariant: .leading, label: "Log In")
                            }
                            
                            Text("Or")
                                .font(.custom("Satoshi-Bold", size: 14))
                                .foregroundColor(Color("darkgrey"))
                                .textCase(.uppercase)
                            
                            Button {
                                
                            } label: {
                                OutlinedButtonView(
                                    label: "Continue with Google",
                                    iconName: "google",
                                    isSystemImage: false
                                )
                            }
                            
                            Button {
                                
                            } label: {
                                OutlinedButtonView(
                                    label: "Continue with Facebook",
                                    iconName: "facebook",
                                    isSystemImage: false
                                )
                            }
                            
                            Button {
                                
                            } label: {
                                OutlinedButtonView(
                                    label: "Continue with Apple",
                                    iconName: "apple.logo",
                                    isSystemImage: true
                                )
                            }
                            
                        }
                        .padding(.top, 32)
                        
                        HStack {
                            Text("Don't have an account?")
                                .font(.custom("Satoshi-Regular", size: 14))
                            
                            Button {
                                
                            } label: {
                                Text("Join with us")
                                    .font(.custom("Satoshi-Bold", size: 14))
                                
                            }
                        }
                        .padding(.top, 24)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.vertical, 24)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
        LoginView()
            .preferredColorScheme(.light)
    }
}
