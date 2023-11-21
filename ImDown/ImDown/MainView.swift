//
//  ContentView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct MainView: View {
    
    var User: Downer
    var stateManager: StateManager
    var homeStateManager = StateManager()
    
    init(User: Downer, stateManager: StateManager) {
        self.User = User
        self.stateManager = stateManager
    }
    
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            if homeStateManager.currentState == StateManager.State.HomeScreen {
                HomeScreen(User: User, stateManager: homeStateManager).cornerRadius(25.0).tabItem {
                    Label("Home", systemImage: "house")
                }.tag(1)
            } else {
                AreyouDownFill(User: User, stateManager: homeStateManager).cornerRadius(25.0).tabItem {
                    Label("Home", systemImage: "house")
                }.tag(1)
            }
            AttendeeView(User: User, stateManager: stateManager).background(Color.white).cornerRadius(25.0).tabItem {
                Label("Attending", systemImage: "calendar.badge.checkmark")
            }.tag(2)
            HostView(User: User, stateManager: stateManager).background(Color.white).cornerRadius(25.0).tabItem {
                Label("Hosting", systemImage: "h.square.on.square")
            }.tag(3)
            ChatView().background(Color.white).cornerRadius(25.0).tabItem {
                Label("Chat", systemImage: "message")
            }.tag(4)
            ProfileView(User: User.profile).background(Color.white).cornerRadius(25.0).tabItem {
                Label("Profile", systemImage: "person")
            }.tag(5)
        }
    }
}

#Preview {
    MainView(User: Downer(userKey: "wesleyhahn"), stateManager: StateManager())
}
