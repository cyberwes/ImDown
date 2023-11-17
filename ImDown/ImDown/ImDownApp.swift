//
//  ImDownApp.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

@main
struct ImDownApp: App {
    
    init() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView(User: Downer())
        }
    }
}
