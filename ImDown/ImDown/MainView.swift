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
            HomeScreen(experience: User.currentExperience).tabItem {
                Label("Home", systemImage: "house")
            }.tag(1)
            AttendeeView(experienceArray: User.attendExperiences).tabItem {
                Label("Attend", systemImage: "calendar.badge.checkmark")
            }.tag(2)
            HostView(experienceArray: User.hostExperiences).tabItem {
                Label("Host", systemImage: "h.square.on.square")
            }.tag(3)
            ChatView().tabItem {
                Label("Chat", systemImage: "message")
            }.tag(4)
            ProfileView(User: User).tabItem {
                Label("Profile", systemImage: "person")
            }.tag(5)
        }
    }
}

#Preview {
    MainView(User: Downer())
}
