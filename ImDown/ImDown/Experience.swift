//
//  Experience.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import Foundation
import SwiftUI

class Experience: Hashable {
    var id: Int
    var eventName: String
    var host: Profile
    var attendee: Profile
    var date: Date
    var description: String
    var location: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, eventName: String, host: Profile, attend: Profile, date: Date, description: String, location: String, imageName: String) {
        self.id = id;
        self.eventName = eventName
        self.host = host
        self.attendee = attend
        self.date = date
        self.description = description
        self.location = location
        self.imageName = imageName
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }

    static func == (lhs: Experience, rhs: Experience) -> Bool {
        return lhs.id == rhs.id
    }
}

class IDGenerator {
    private var id: Int

        init(id: Int = 0) {
            self.id = id
        }

        func newId() -> Int {
            let newId = self.id + 1
            self.id = newId
            return newId
        }
}
