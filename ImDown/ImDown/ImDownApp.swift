//
//  ImDownApp.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

@main
struct ImDownApp: App {
    @State var User: Downer
    @State var stateManager: StateManager
    
    init() {
        User = Downer(userKey: "wesleyhahn")
        stateManager = StateManager()
    }
    
    var body: some Scene {
        WindowGroup {
            if (stateManager.currentState != StateManager.State.AreYouDown) {
                MainView(User: User, stateManager: stateManager).background(Color.black)
            } else {
                AreyouDown(user: User, stateManager: stateManager)
            }
        }
    }
}

@Observable
class StateManager {
    
    enum State {
        case AreYouDown
        case HomeScreen
        case Carosel
        case SelectedCard
        case Experience
        case AttendExperience
        case Empty
    }
    
    enum HostState {
        case Attend
        case Host
    }
    
    var currentMode = HostState.Attend
    
    var timer = 0
    
    var attend: Bool = true
    
    var currentExperience = Experience()
    
    var currentState: State = State.AreYouDown

}
