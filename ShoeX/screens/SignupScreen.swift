//
//  SignupView.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 10/06/2023.
//

import SwiftUI

struct SignupScreen: View {
    @Environment(\.colorScheme) private var colorScheme;
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Join with our Market")
                        .font(.custom("Teko-Regular", size: 42))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 32)
                    
                    Text("4,000,000 + shoes already to buy or sell")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 8)
                    
                    VStack(spacing: 0) {
                        TextInput(value: firstname, label: "First Name", placeholder: "Please enter your first name")
                        TextInput(value: lastname, label: "Last Name", placeholder: "Please enter your last name")
                        TextInput(value: email, label: "Email address", placeholder: "Please enter your email")
                        TextInput(value: password, label: "Password", placeholder: "*********", isPasswordField: true)
                        
                        VStack(spacing: 12) {
                           
                            NavigationLink {
                                SecureYourAccountScreen()
                            } label: {
                                ButtonView(buttonVariant: .leading, label: "Sign Up")
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
                        .padding(.top, 24)
                        
                        HStack {
                            Text("Already have an account?")
                                .font(.custom("Satoshi-Regular", size: 14))
                            
                            NavigationLink {
                                LoginScreen()
                            } label: {
                                Text("Sign in")
                                    .font(.custom("Satoshi-Bold", size: 14))
                                    .foregroundColor(.blue)
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupScreen()
            .preferredColorScheme(.dark)
        SignupScreen()
            .preferredColorScheme(.light)
    }
}
