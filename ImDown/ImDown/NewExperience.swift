//
//  NewExperience.swift
//  ImDown
//
//  Created by Wesley Hahn on 16/11/2023.
//

import SwiftUI

var textFieldColor = Color.white

struct NewExperience: View {
    var body: some View {
        VStack {
            HStack{
                Text("NEW EXPERIENCE")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            HStack{
                Text("Experience Name")
                    .fontWeight(.bold)
                Spacer()
            }.padding(.horizontal)
            TextField("Experience Name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
                    TextField("Date", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
                    TextField("Time", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
            TextField("Location", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
            TextField("What should someone know about your event?", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
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
                    
                }
            }.font(.title2)
            .padding()
            Spacer()
        }
    }
}

#Preview {
    NewExperience()
}
