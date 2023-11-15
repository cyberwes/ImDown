//
//  ContentView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            HomeScreen().tabItem {
                Label("Home", systemImage: "house")
            }.tag(1)
            AttendeeView().tabItem {
                Label("Attend", systemImage: "calendar.badge.checkmark")
            }.tag(2)
            HostView().tabItem {
                Label("Host", systemImage: "h.square.on.square")
            }.tag(3)
            ChatView().tabItem {
                Label("Chat", systemImage: "message")
            }.tag(4)
            ProfileView().tabItem {
                Label("Profile", systemImage: "person")
            }.tag(5)
        }
    }
}

#Preview {
    MainView()
}
