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
    var host: String;
    var date: String;
    var description: String;
    var location: String;
    private var imageName: String;
    var image: Image {
        Image(imageName)
    }
    
    init(id: Int, eventName: String, host: String, date: String, description: String, location: String, imageName: String) {
        self.id = id;
        self.eventName = eventName
        self.host = host
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
