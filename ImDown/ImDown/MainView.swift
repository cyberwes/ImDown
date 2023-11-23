//
//  ContentView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct MainView: View {
    
    @State var User: Downer
    @State var stateManager: StateManager
    @State var homeStateManager = StateManager()
    @State var attend = true
    @State var selection: Int
    @State var timerRunning = false
    
    init(User: Downer, stateManager: StateManager) {
        self.User = User
        self.stateManager = stateManager
        self.selection = 1
        homeStateManager.currentMode = stateManager.currentMode
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                if homeStateManager.currentState == StateManager.State.HomeScreen {
                    HomeScreen(User: User, stateManager: homeStateManager).cornerRadius(25.0).tabItem {
                        Label("Home", systemImage: "house")
                    }.tag(1)
                } else if homeStateManager.currentState == StateManager.State.Carosel {
                    CarouselAttemptTwo(User: User, stateManager: homeStateManager).cornerRadius(25.0).tabItem {
                        Label("Home", systemImage: "house")
                    }.tag(1)
                        .onAppear{
                            homeStateManager.timer = 60
                        }
                } else {
                    AreyouDownFill(User: User, stateManager: homeStateManager).cornerRadius(25.0).tabItem {
                        Label("Home", systemImage: "house")
                    }.tag(1)
                }
                if stateManager.attend {
                    AttendeeView(User: User, stateManager: stateManager, selection: selection).background(Color.white).cornerRadius(25.0).tabItem {
                        Label("Upcoming", systemImage: "calendar.badge.checkmark")
                    }.tag(2)
                } else {
                    ZStack {
                        ExperienceView(experience: stateManager.currentExperience, User: User)
                        VStack {
                            HStack {
                                Spacer()
                                Button(action: {
                                    stateManager.attend = true
                                }, label: {
                                    HStack {
                                        Image(systemName: "chevron.left")
                                            
                                        Text("Back")
                                    }
                                    .foregroundColor(.white)
                                    .padding(10.0)
                                    .background(Color("primary"))
                                    .cornerRadius(20)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                })
                            }
                            Spacer()
                        }.padding()
                    }.background(Color.white).cornerRadius(25.0).tabItem {
                        Label("Upcoming", systemImage: "calendar.badge.checkmark")
                    }.tag(2)
                }
                HostView(User: User, stateManager: stateManager).background(Color.white).cornerRadius(25.0).tabItem {
                    Label("Hosting", systemImage: "h.square.on.square")
                }.tag(3)
                ChatView(User: User)
                    .background(Color.white).cornerRadius(25.0).tabItem {
                    Label("Chat", systemImage: "message")
                }.tag(4)
                ProfileView(LoggedInUser: User, User: User.profile).background(Color.white).cornerRadius(25.0).tabItem {
                    Label("Profile", systemImage: "person")
                }.tag(5)
            }
            VStack {
                HStack {
                    Spacer()
                    if (homeStateManager.timer > 0 && homeStateManager.timer < 61) {
                        Text(String(homeStateManager.timer))
                            .font(Font.custom("SFCompactDisplay-Bold", size: 48.0))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                            .background(Color("Tertiary"))
                            .cornerRadius(25.0)
                            .onAppear {
                                if (timerRunning == false) {
                                    timerRunning = true
                                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
                                        homeStateManager.timer = homeStateManager.timer - 1
                                    }
                                }
                            }
                    }
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    MainView(User: Downer(userKey: "wesleyhahn"), stateManager: StateManager())
}
