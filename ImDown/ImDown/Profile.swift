//
//  Profile.swift
//  ImDown
//
//  Created by Wesley Hahn on 18/11/2023.
//

import Foundation

class Profile {
    
    var email: String = ""
    var password: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var age: String = ""
    var pronouns: String = ""
    var location: String = ""
    var about: String = ""
    var interests: String = ""
    
    init(email: String, password: String) {
        for user in Users {
            if (Users[user.key]!["email"] == email && Users[user.key]!["password"] == password) {
                self.email = Users[user.key]!["email"]!
                self.password = Users[user.key]!["password"]!
                self.firstName = Users[user.key]!["firstName"]!
                self.lastName = Users[user.key]!["lastName"]!
                self.age = Users[user.key]!["age"]!
                self.pronouns = Users[user.key]!["pronouns"]!
                self.location = Users[user.key]!["location"]!
                self.about = Users[user.key]!["about"]!
                self.interests = Users[user.key]!["interests"]!
            }
        }
    }
    
    init(userKey: String) {
        if (userKey != "") {
            self.email = Users[userKey]!["email"]!
            self.password = Users[userKey]!["password"]!
            self.firstName = Users[userKey]!["firstName"]!
            self.lastName = Users[userKey]!["lastName"]!
            self.age = Users[userKey]!["age"]!
            self.pronouns = Users[userKey]!["pronouns"]!
            self.location = Users[userKey]!["location"]!
            self.about = Users[userKey]!["about"]!
            self.interests = Users[userKey]!["interests"]!

        } else {
            self.email = ""
            self.password = ""
            self.firstName = ""
            self.lastName = ""
            self.age = ""
            self.pronouns = ""
            self.location = ""
            self.about = ""
            self.interests = ""
        }
    }
     
    init() {
        self.email = ""
        self.password = ""
        self.firstName = ""
        self.lastName = ""
        self.age = ""
        self.pronouns = ""
        self.location = ""
        self.about = ""
        self.interests = ""
    }
}
