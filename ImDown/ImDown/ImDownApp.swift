//
//  ImDownApp.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

@main
struct ImDownApp: App {
    var User: Downer;
    
    init() {
        User = Downer(userKey: "wesleyhahn")
    }
    
    var body: some Scene {
        WindowGroup {
            AreyouDown(User: User)
        }
    }
}
