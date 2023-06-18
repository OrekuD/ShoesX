//
//  NotificationsScreen.swift
//  ShoeX
//
//  Created by David Opoku on 11/06/2023.
//

import SwiftUI

struct Notification: Identifiable {
    let id: UUID = .init()
    var title: String
    var time: String
    var description: String
    var isUnread: Bool
}

struct NotificationsScreen: View {
    
    let notifications: [Notification] = [
        .init(
            title: "🔔 New Release Product!",
            time: "6 hr. ago",
            description: "The new product is $182 for the Adidas Yeezy Slide Bone (2023).",
            isUnread: true
        ),
        .init(
            title: "🔔 New Low Ask Alert!",
            time: "1 day ago",
            description: "The new lowest Ask is $157 for the adidas Yeezy Slide Bone (2022 Restock).",
            isUnread: true
        ),
        .init(
            title: "New Release Product",
            time: "2 days ago",
            description: "856 sold since you last looked. Get yours today!",
            isUnread: true
        ),.init(
            title: "🔔 New Release Product!",
            time: "6 hr. ago",
            description: "The new product is $182 for the Adidas Yeezy Slide Bone (2023).",
            isUnread: true
        ),
        .init(
            title: "🔔 New Low Ask Alert!",
            time: "1 day ago",
            description: "The new lowest Ask is $157 for the adidas Yeezy Slide Bone (2022 Restock).",
            isUnread: true
        ),
        .init(
            title: "New Low Ask Alert!",
            time: "3 days ago",
            description: "The new lowest Ask is $150 for the Addidas Yeezy Slide Bone (2022 Restock).",
            isUnread: false
        ),
        .init(
            title: "New Release Product",
            time: "6 hr. ago",
            description: "The new product is $180 for the Addidas Yeezy Slide Bone",
            isUnread: false
        ),
        .init(
            title: "New Release Product",
            time: "6 hr. ago",
            description: "The new product is $180 for the Addidas Yeezy Slide Bone",
            isUnread: false
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Header(title: "Notifications", hasCheckButton: true)
            ScrollView {
                ForEach(notifications) {notification in
                    HStack(alignment: .top, spacing: 6) {
                        Circle()
                            .frame(width: 8)
                            .foregroundColor(notification.isUnread ? Color("unread_notifications") : .clear)
                            .padding(.top, 4)
                        Image("slide_2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .top, spacing: 8) {
                                Text(notification.title)
                                    .font(.custom("Satoshi-Bold", size: 14))
                                Spacer()
                                Text(notification.time)
                                    .font(.custom("Satoshi-Regular", size: 12))
                                    .foregroundColor(.secondary)
                            }
                            Text(notification.description)
                                .font(.custom("Satoshi-Regular", size: 12))
                                .opacity(notification.isUnread ? 1 : 0.5)
                        }
                        .padding(.leading, 12)
                        
                    }
                    .padding(.horizontal, 14)
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 18)
                }
                .padding(.top, 24)
            }
        }
    }
}

struct NotificationsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsScreen()
            .preferredColorScheme(.dark)
    }
}
