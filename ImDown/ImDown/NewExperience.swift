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
    @State private var time: String = ""
    @State private var location: String = ""
    @State private var imageName: String = "Baking"
    @State private var description: String = ""
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color("primary"))
            VStack {
                Image(imageName).resizable().scaledToFill()
                Spacer()
            }
            VStack {
                TextField("Experience Name".uppercased(), text: $name)
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
                    TextField("LOCATION, 2000", text: $date)
                        .font(Font.custom("SFMono-Regular", size: 16.0))
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                    Spacer()
                }.padding(.horizontal)
                Spacer()
                Text("Upload a photo")
                Spacer()
                TextField("Describe your event!", text: $description)
                    .padding(.horizontal)
                    .shadow(radius: 4)
                HStack {
                    Spacer()
                    Button(action: {
                        User.host(eventName: name, date: Date.now, description: description, location: location, imageName: imageName)
                        print(name)
                        name = ""
                        date = ""
                        time = ""
                        description = ""
                        location = ""
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
