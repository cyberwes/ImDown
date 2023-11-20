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
            if (stateManager.currentState == StateManager.State.HomeScreen) {
                MainView(User: User, stateManager: stateManager)
            } else {
                AreyouDown(User: User, stateManager: stateManager)
            }
        }
    }
}

@Observable
class StateManager {
    
    enum State {
        case AreYouDown
        case HomeScreen
    }
    
    var currentState: State = State.AreYouDown
    
}
