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
    init(
        currentExperience: Experience = Experience(id: 1, eventName: "make coffee", host: "Wesley", date: "16/11/23", description: lorem, location: "Rosebery, 2018", imageName: "Baking"),
        hostExperiences: Experience = Experience(id: 2, eventName: "Knitting a hat", host: "Wesley", date: "16/11/23", description: lorem, location: "Sydney, 2000", imageName: "Baking"),
        attendExperiences: Experience = Experience(id: 3, eventName: "Bake a Cake", host: "Sarah", date: "16/11/23", description: lorem, location: "Norwest, 2153", imageName: "Baking") ) {
        self.currentExperience = currentExperience;
        self.hostExperiences.append(hostExperiences);
        self.hostExperiences.append(attendExperiences);
        self.firstName = "Wesley";
        self.lastName = "Hahn";
        self.imageName = "Baker";
        self.about = lorem;
        self.age = "28";
        self.pronouns = "he/him";
        self.location = "Rosebery, 2018";
    }
    
    func attend() {
        self.attendExperiences.append(currentExperience)
        currentExperience = Experience(id: 0, eventName: "", host: "", date: "", description: "", location: "", imageName: "")
    }
}
