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
          currentExperience: Experience = Experience(id: 0, eventName: " ", host: Profile(), attend: Profile(), date: Date.now, description: lorem, location: " ", imageName: " "),
          hostExperiences: [Experience] = [Experience(id: 0, eventName: " ", host: Profile(), attend: Profile(), date: Date.now, description: lorem, location: " ", imageName: " ")],
          attendExperiences: [Experience] = [Experience(id: 0, eventName: " ", host: Profile(), attend: Profile(), date: Date.now, description: lorem, location: " ", imageName: " ")]
    ) {
        self.userKey = userKey;
        self.profile = Profile(userKey: userKey)
        self.currentExperience = currentExperience;
        self.hostExperiences = hostExperiences;
        self.attendExperiences = attendExperiences;
        self.currentExperience = getCurrentExperience()
        self.hostExperiences = getHostExperience()
        self.attendExperiences = getAttendExpereince()
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
    
    func getCurrentExperience() -> Experience {
        let randExp = ExperienceData.randomElement()
        let current = Experience(id: ID.newId(), eventName: randExp!["eventName"] as! String, host: Profile(userKey: randExp!["host"] as! String), attend: Profile(userKey: randExp!["attendee"] as! String), date: randExp!["date"] as! Date, description: randExp!["description"] as! String, location: randExp!["location"] as! String, imageName: randExp!["imageName"] as! String)
        return current
    }
    
    func getAttendExpereince() -> [Experience] {
        var attending: [Experience] = []
        for e in ExperienceData {
            if (e["attendee"] as! String == userKey) {
                attending.append(Experience(id: ID.newId(), eventName: e["eventName"] as! String, host: Profile(userKey: e["host"] as! String), attend: Profile(userKey: e["attendee"] as! String), date: e["date"] as! Date, description: e["description"] as! String, location: e["location"] as! String, imageName: e["imageName"] as! String))
            }
        }
        return attending
    }
    
    func getHostExperience() -> [Experience] {
        var hosting: [Experience] = []
        for e in ExperienceData {
            if (e["host"] as! String == userKey) {
                hosting.append(Experience(id: ID.newId(), eventName: e["eventName"] as! String, host: Profile(userKey: e["host"] as! String), attend: Profile(userKey: e["attendee"] as! String), date: e["date"] as! Date, description: e["description"] as! String, location: e["location"] as! String, imageName: e["imageName"] as! String))
            }
        }
        return hosting
    }
}
