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
    @State private var date: Date = Date()
    @State private var location: String = ""
    @State private var imageName: String = "Baking"
    @State private var description: String = ""
    @State private var timestart = Date.now
    
    var body: some View {
        ZStack {
            Rectangle().fill(.black)
            Rectangle().foregroundColor(Color("primary")).opacity(0.75)
            Image(imageName).resizable().scaledToFill()
            Rectangle().fill(Gradient(colors: [Color.black, Color.clear, Color.clear, Color.clear, Color.black]))
                .opacity(0.5)
            VStack {
                HStack {
                    TextField(experience.eventName.uppercased(), text: $name)
                        .font(Font.custom("SFCompactDisplay-Bold", size: 35.00))
                        .foregroundColor(.white)
                        .padding([.top, .leading, .trailing])
                        .shadow(radius: 4)
                    Button(action: {
                        name = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                            .frame(width: 50, alignment: .leading)
                            
                    })
                }
                HStack {
                    Image(systemName: "calendar" )
                        .foregroundColor(Color.white)
                    
                    DatePicker("", selection: $date, displayedComponents: .date)
                        .labelsHidden()
                      //  .foregroundColor(Color.wh)
                        .background(Color.white)
                        .cornerRadius(5.0)
                        .padding()
                        .shadow(radius: 10)
                    DatePicker(selection: $timestart, displayedComponents: .hourAndMinute){}
                        .labelsHidden()
                        .border(Color.white, width: 180)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(radius: 10)
                     Spacer()
                   
                 
                }
                .padding(.horizontal)
                HStack {
                    Image(systemName: "location")
                        .foregroundColor(Color.white)
                    TextField(experience.location.uppercased(), text: $location)
                        .font(Font.custom("SFMono-Regular", size: 16.0))

                       // .shadow(radius: 4)
                    
                }.padding(.horizontal)
                Spacer()
                Text("Upload a photo").font(Font.custom("SFCompactDisplay-Bold", size: 36)).foregroundColor(.white)
                Spacer()
                HStack {
                    Spacer()
                    Text("Hosted by " + User.profile.firstName.capitalized)
                        .font(Font.custom("SFMono-Regular", size: 16.0))
                        .foregroundColor(Color("primary"))
                        .padding(12)
                        .background(.white)
                        .cornerRadius(30)
                }
                .frame(width: width)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                TextField(experience.description, text: $description)
                    .padding(.horizontal)
                    .shadow(radius: 4)
                    .foregroundColor(.white)

                HStack {
                    Spacer()
                    Button(action: {
                        User.unhost(experience: experience)
                        User.host(
                            eventName: (self.name != "") ? self.name : experience.eventName,
                            date: Date(),
                            description: (self.description != "") ? self.description : experience.description,
                            location: (self.location != "") ? self.location : experience.location,
                            imageName: (self.imageName != "") ? self.imageName : experience.imageName)
                        print(name)
                        name = experience.eventName
                        date = Date()
                        description = experience.description
                        location = experience.location
                        imageName = "Baking"
                    }, label: {
                        Text("Add Experience")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color("primary"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 20)
                            .shadow(radius: 10)
                    })
                    .frame(width: width, height: 60)
                    .background(.white)
                    .cornerRadius(10.0)
                    .shadow(radius: 10)
                    .padding()
                }
            }
            .frame(width: 375)
        }
    }
}

#Preview {
    NewExperience(User: Downer(userKey: "wesleyhahn"), experience: Experience(id: 10, eventName: "New Experience", host: Profile(userKey: "wesleyhahn"), attend: Profile(), date: Date.now, description: lorem, location: "Sydney, 2000", imageName: "", hint: "New Hint"))
}
