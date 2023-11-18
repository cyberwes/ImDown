//
//  NewExperience.swift
//  ImDown
//
//  Created by Wesley Hahn on 16/11/2023.
//

import SwiftUI

var textFieldColor = Color.white

struct NewExperience: View {
    
    var User: Downer;
    var experience: Experience;
    @State private var name: String = ""
    @State private var date: String = ""
    @State private var location: String = ""
    @State private var imageName: String = "Baking"
    @State private var description: String = ""
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color("primary"))
            Image(imageName).resizable().scaledToFill()
            VStack {
                TextField(experience.eventName.uppercased(), text: $name)
                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.00))
                    .foregroundColor(.white)
                    .padding([.top, .leading, .trailing])
                    .shadow(radius: 4)
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(Color.white)
                    TextField(Formatter.formatDate(Date.now), text: $date)
                        .font(Font.custom("SFMono-Regular", size: 16.0))
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    Spacer()
                }.padding(.horizontal)
                HStack {
                    Image(systemName: "location")
                        .foregroundColor(Color.white)
                    TextField(experience.location.uppercased(), text: $location)
                        .font(Font.custom("SFMono-Regular", size: 16.0))
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    Spacer()
                }.padding(.horizontal)
                Spacer()
                Text("Upload a photo").font(Font.custom("SFCompactDisplay-Bold", size: 36)).foregroundColor(.white)
                Spacer()
                HStack {
                    Spacer()
                    Text("Hosted by " + User.firstName.capitalized)
                        .font(Font.custom("SFMono-Regular", size: 16.0))
                        .foregroundColor(TextColor)
                        .padding(12)
                        .background(.black)
                        .cornerRadius(30)
                }
                .frame(width: width)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                TextField(experience.description, text: $description)
                    .padding(.horizontal)
                    .shadow(radius: 4)
                HStack {
                    Spacer()
                    Button(action: {
                        User.unhost(experience: experience)
                        User.host(
                            eventName: (self.name != "") ? self.name : experience.eventName,
                            date: (self.date != "") ? Formatter.stringToDate(self.date) : experience.date,
                            description: (self.description != "") ? self.description : experience.description,
                            location: (self.location != "") ? self.location : experience.location,
                            imageName: (self.imageName != "") ? self.imageName : experience.imageName)
                        print(name)
                        name = experience.eventName
                        date = Formatter.formatDate(experience.date)
                        description = experience.description
                        location = experience.location
                        imageName = "Baking"
                    }, label: {
                        Text("Confirm")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 36))
                            .foregroundColor(.white)
                    })
                    .frame(width: width, height: 50)
                    .background(.black)
                    .cornerRadius(25.0)
                    .shadow(radius: 10)
                    .padding()
                }
            }.frame(width: 375)
        }
    }
}

#Preview {
    NewExperience(User: Downer(userKey: "wesleyhahn"), experience: Experience(id: 10, eventName: "New Experience", host: Downer(userKey: "wesleyhahn").firstName, date: Date.now, description: lorem, location: "Sydney, 2000", imageName: ""))
}
