//
//  Downer.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import Foundation

var lorem = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Set do eiusmod tempor incididunt ut labore et dolor magna aliqua."

@Observable
class Downer {
    var userKey: String
    var ID: IDGenerator = IDGenerator(id: 2)
    var profile: Profile
    var currentExperience: Experience
    var hostExperiences: [Experience] = []
    var attendExperiences: [Experience] = []
    init( userKey: String,
          currentExperience: Experience = Experience(id: 0, eventName: "make coffee", host: Profile(), attend: Profile(userKey:"wesleyhahn"), date: Date.now, description: lorem, location: "Rosebery, 2018", imageName: "Baking"),
          hostExperiences: Experience = Experience(id: 1, eventName: "Knitting a hat", host: Profile(userKey:"wesleyhahn"), attend: Profile(), date: Date.now, description: lorem, location: "Sydney, 2000", imageName: "Baking"),
        attendExperiences: Experience = Experience(id: 2, eventName: "Bake a Cake", host: Profile(), attend: Profile(userKey:"wesleyhahn"), date: Date.now, description: lorem, location: "Norwest, 2153", imageName: "Baking") ) {
        self.userKey = userKey;
        self.profile = Profile(userKey: userKey)
        self.currentExperience = currentExperience;
        self.hostExperiences.append(hostExperiences);
        self.hostExperiences.append(attendExperiences);
        self.attendExperiences.append(attendExperiences);
    }
    
    func attend() {
        self.attendExperiences.append(currentExperience)
        currentExperience = Experience(id: 0, eventName: "", host: Profile(), attend: profile, date: Date.now, description: "", location: "", imageName: "")
    }
    
    func unattend(experience: Experience) {
        self.attendExperiences.removeAll { $0.id == experience.id }
    }
    
    func host(eventName: String, date: Date, description: String, location: String, imageName: String) {
        self.hostExperiences.append(Experience(id: ID.newId(), eventName: eventName, host: profile, attend: Profile(), date: date, description: description, location: location, imageName: imageName))
    }
    
    func unhost(experience: Experience) {
        self.hostExperiences.removeAll { $0.id == experience.id }
    }
}
