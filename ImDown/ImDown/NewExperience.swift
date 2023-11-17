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
    @State private var name: String = ""
    @State private var date: String = ""
    @State private var time: String = ""
    @State private var location: String = ""
    @State private var imageName: String = "Baking"
    @State private var description: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Image("Baking").resizable().scaledToFill().frame(height: 100)
                Spacer()
            }
            VStack {
                Spacer()
                
                HStack{
                    Text("NEW EXPERIENCE")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                HStack{
                    Text("Experience Name")
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.horizontal)
                TextField("Experience Name", text: $name)
                    .padding(8.0)
                    .background(textFieldColor)
                    .cornerRadius(8.0)
                    .padding(.horizontal)
                    .shadow(radius: 4)
                HStack {
                    VStack {
                        HStack{
                            Text("Date")
                                .fontWeight(.bold)
                            Spacer()
                        }
                        TextField("Date", text: $date)
                            .padding(8.0)
                            .background(textFieldColor)
                            .cornerRadius(8.0)
                            .shadow(radius: 4)
                    }
                    Spacer()
                    VStack {
                        HStack{
                            Text("Time")
                                .fontWeight(.bold)
                            Spacer()
                        }
                        TextField("Time", text: $time)
                            .padding(8.0)
                            .background(textFieldColor)
                            .cornerRadius(8.0)
                            .shadow(radius: 4)
                    }
                }.padding(.horizontal)
                HStack{
                    Text("Location")
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.horizontal)
                TextField("Location", text: $location)
                    .padding(8.0)
                    .background(textFieldColor)
                    .cornerRadius(8.0)
                    .padding(.horizontal)
                    .shadow(radius: 4)
                HStack{
                    Text("Details")
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.horizontal)
                TextField("What should someone know about your event?", text: $description)
                    .padding(8.0)
                    .frame(height: 100)
                    .background(textFieldColor)
                    .cornerRadius(8.0)
                    .padding(.horizontal)
                    .shadow(radius: 4)
                HStack{
                    Text("Additional Details")
                        .fontWeight(.bold)
                    Spacer()
                }.padding(.horizontal)
                TextField("Additional Details", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding(8.0)
                    .background(textFieldColor)
                    .cornerRadius(8.0)
                    .padding(.horizontal)
                    .shadow(radius: 4)
                HStack {
                    Spacer()
                    Button("Confirm") {
                        User.host(eventName: name, date: Date.now, description: description, location: location, imageName: imageName)
                        print(name)
                        name = ""
                        date = ""
                        time = ""
                        description = ""
                        location = ""
                        imageName = "Baking"
                    }
                }.font(.title2)
                    .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    NewExperience(User: Downer())
}
