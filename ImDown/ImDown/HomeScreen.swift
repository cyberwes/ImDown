//
//  HomeScreen.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

var TextColor = Color.white;
var ButtonColor = Color("tertiary");
var width = 350.0

import SwiftUI

struct HomeScreen: View {
    
    var User: Downer
    
    var body: some View {
        NavigationView {
            if (User.currentExperience.eventName != "") {
                ZStack{
                    User.currentExperience.image.resizable().scaledToFill()
                    VStack{
                        HStack {
                            Text(User.currentExperience.eventName.uppercased())
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Spacer()
                            
                            NavigationLink(destination: NewExperience(User: User)) {
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(Color.black)
                                    .frame(width: 40, height: 40)
                                    .background(Color.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 10)
                            }
                        }
                        .frame(width: width)
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(Color.white)
                            Text(User.currentExperience.date)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                            Image(systemName: "location")
                                .foregroundColor(Color.white)
                            Text(User.currentExperience.location)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        .frame(width: width)
                        .shadow(radius: 4)
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Hosted by " + User.currentExperience.host)
                                .font(.headline)
                                .foregroundColor(TextColor)
                                .padding(12)
                                .background(ButtonColor)
                                .cornerRadius(30)
                        }
                        .frame(width: width)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        VStack {
                            HStack {
                                Text(User.currentExperience.description)
                                    .fontWeight(.semibold)
                                    .foregroundColor(TextColor)
                                    .padding(.vertical, 4.0);
                            }
                            .shadow(radius: 4.0)
                            Button(action: {
                                User.attend()
                            }, label: {
                                Text("I⚡️m Down!")
                                    .font(.title)
                                    .fontWeight(.semibold)
                                    .foregroundColor(TextColor)
                            })
                            .frame(width: width, height: 50)
                            .background(ButtonColor)
                            .cornerRadius(25.0)
                            .shadow(radius: 10)
                            .padding(1.0)
                        }
                        .padding()
                        .frame(width:width)
                        .cornerRadius(15.0)
                    }
                    .padding()
                }
                .padding(.horizontal)
            }
            else {
                VStack {
                    HStack {
                        Spacer()
                        NavigationLink(destination: NewExperience(User: User)) {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color.black)
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }.padding()
                    }
                    Spacer()
                    Text("Have Fun! 🎉").font(.largeTitle).fontWeight(.bold).foregroundColor(.white)
                    Text("That experience has been added to your schedule.").foregroundColor(.white)
                    Spacer()
                }
                .background(Color.black)
                .padding()
            }
        }
    }
}
        

#Preview {
    HomeScreen(
        User: Downer()
    )
}
