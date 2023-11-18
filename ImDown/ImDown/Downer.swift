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
    var firstName: String = "";
    var lastName: String = "";
    var imageName: String = "";
    var about: String = "";
    var pronouns: String = "";
    var age: String = "";
    var location: String = "";
    var currentExperience: Experience
    var hostExperiences: [Experience] = []
    var attendExperiences: [Experience] = []
    init( userKey: String,
        currentExperience: Experience = Experience(id: 0, eventName: "make coffee", host: "Wesley", date: Date.now, description: lorem, location: "Rosebery, 2018", imageName: "Baking"),
        hostExperiences: Experience = Experience(id: 1, eventName: "Knitting a hat", host: "Wesley", date: Date.now, description: lorem, location: "Sydney, 2000", imageName: "Baking"),
        attendExperiences: Experience = Experience(id: 2, eventName: "Bake a Cake", host: "Sarah", date: Date.now, description: lorem, location: "Norwest, 2153", imageName: "Baking") ) {
        self.userKey = userKey;
        self.currentExperience = currentExperience;
        self.hostExperiences.append(hostExperiences);
        self.hostExperiences.append(attendExperiences);
        self.attendExperiences.append(attendExperiences);
            self.firstName = Users[userKey]?["firstName"] ?? "John";
            self.lastName = Users[userKey]?["lastName"] ?? "Smith";
        self.imageName = "Baker";
            self.about = Users[userKey]?["about"] ?? lorem;
            self.age = Users[userKey]?["age"] ?? "25";
            self.pronouns = Users[userKey]?["pronouns"] ?? "he/him";
            self.location = Users[userKey]?["location"] ?? "Sydney, 2000";
    }
    
    func attend() {
        self.attendExperiences.append(currentExperience)
        currentExperience = Experience(id: 0, eventName: "", host: "", date: Date.now, description: "", location: "", imageName: "")
    }
    
    func unattend(experience: Experience) {
        self.attendExperiences.removeAll { $0.id == experience.id }
    }
    
    func host(eventName: String, date: Date, description: String, location: String, imageName: String) {
        self.hostExperiences.append(Experience(id: ID.newId(), eventName: eventName, host: self.firstName, date: date, description: description, location: location, imageName: imageName))
    }
}
