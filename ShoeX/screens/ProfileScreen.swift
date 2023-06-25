//
//  ProfileScreen.swift
//  ShoeX
//
//  Created by David Opoku on 11/06/2023.
//

import SwiftUI

struct Setting: Identifiable {
    let id: UUID = .init()
    var title: String
    var description: String
    var icon: String
    var screen: AnyView
}

struct ProfileScreen: View {
    
    let settings: [Setting] = [
        .init(
            title: "Profile",
            description: "Edit your Password. Name, Shoe Size, Email, Username",
            icon: "user",
            screen: AnyView(Text("dd"))
        ),
        .init(
            title: "Security",
            description: "FaceID, Two-Step Verification",
            icon: "security",
            screen: AnyView(Text("dd"))
        ),
        .init(
            title: "Portfolio",
            description: "See the value of your items",
            icon: "portfolio",
            screen: AnyView(Text("dd"))
        ),
        .init(
            title: "Sell",
            description: "Sales, Seller Profiles",
            icon: "sell",
            screen: AnyView(Text("dd"))
        ),
        .init(
            title: "Buy",
            description: "Orders, Bids, In-progress",
            icon: "buy",
            screen: AnyView(Text("dd"))
        ),
        .init(
            title: "Following",
            description: "Products you're watching",
            icon: "following",
            screen: AnyView(Text("dd"))
        ),
        .init(
            title: "Settings",
            description: "Billing, Shipping, Payout, Notifications",
            icon: "settings",
            screen: AnyView(Text("dd"))
        ),
    ]
    
    let extraLinks: [String] = [
        "News & Blog",
        "How it work",
        "Reviews",
        "Currency"
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Header(title: "Account", hasCheckButton: false)
            ScrollView {
                VStack {
                    ForEach(settings) {setting in
                        VStack {
                            HStack {
                                Image(setting.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 22, height: 22)
                                    .frame(width: 48, height: 48)
                                    .background(.primary.opacity(0.2))
                                VStack(alignment: .leading) {
                                    Text(setting.title)
                                        .font(.custom("Satoshi-Bold", size: 16))
                                    Text(setting.description)
                                        .font(.custom("Satoshi-Regular", size: 16))
                                        .foregroundColor(.secondary)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .padding(.leading, 6)
                                Spacer()
                            }
                        }
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color("border"))
                    }
                }
                .padding(.top, 7)
                
                VStack(spacing: 0) {
                    ForEach(extraLinks, id: \.self) { link in
                        Button {
                            
                        } label: {
                            HStack {
                                Text(link)
                                    .font(.custom("Satoshi-Bold", size: 18))
                                    .foregroundColor(.primary)
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 14)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 18)
                            .overlay {
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(Color("border"))
                                    .frame(maxHeight: .infinity, alignment: .bottom)
                            }
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Sign out")
                            .font(.custom("Satoshi-Bold", size: 18))
                            .foregroundColor(Color("pink"))
                    }
                    .padding(.vertical, 40)
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .preferredColorScheme(.dark)
    }
}
