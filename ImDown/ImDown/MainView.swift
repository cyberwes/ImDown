//
//  ContentView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct MainView: View {
    
    var User: Downer;
    
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            HomeScreen(User: User).tabItem {
                Label("Home", systemImage: "house")
            }.tag(1)
            AttendeeView(User: User).tabItem {
                Label("Attending", systemImage: "calendar.badge.checkmark")
            }.tag(2)
            HostView(User: User).tabItem {
                Label("Hosting", systemImage: "h.square.on.square")
            }.tag(3)
            ChatView().tabItem {
                Label("Chat", systemImage: "message")
            }.tag(4)
            ProfileView(User: User.profile).tabItem {
                Label("Profile", systemImage: "person")
            }.tag(5)
        }
    }
}

#Preview {
    MainView(User: Downer(userKey: "wesleyhahn"))
}
