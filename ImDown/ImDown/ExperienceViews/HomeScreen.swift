//
//  HomeScreen.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

var TextColor = Color.white;
var ButtonColor = Color("primary");
var width = 360.0

import SwiftUI

struct HomeScreen: View {
    
    var User: Downer
    @State var timer: Int = 60;
    
    @State var feedbackHeading: String = "Are You Down?"
    @State var feedbackText: String = "More Experiences coming soon!"
    
    @State var timerRunning = false
    
    var body: some View {
        NavigationView {
            if (timer > 0 && User.currentExperience.eventName != "") {
                ZStack{
                    User.currentExperience.image.resizable().scaledToFill()
                    Rectangle().fill(Gradient(colors: [Color.black, Color.clear, Color.clear, Color.clear, Color.black]))
                        .opacity(0.5)
                    VStack{
                        HStack {
                            Text(User.currentExperience.eventName.uppercased())
                                .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                                .foregroundColor(Color.white)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            Spacer()
                        }
                        .frame(width: width)
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(Color.white)
                            Text(Formatter.formatDate(User.currentExperience.date))
                                .font(Font.custom("SFMono-Regular", size: 16.0))                            .foregroundColor(Color.white)
                            Spacer()
                        }
                        .frame(width: width)
                        .shadow(radius: 4)
                        HStack {
                            Image(systemName: "location")
                                .foregroundColor(Color.white)
                            Text(User.currentExperience.location.uppercased())
                                .font(Font.custom("SFMono-Regular", size: 16.0))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        .frame(width: width)
                        .shadow(radius: 4)
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(destination: ProfileView(User: User.currentExperience.host), label: {
                                Text("Hosted by " + User.currentExperience.host.firstName.capitalized)
                                    .font(Font.custom("SFMono-Regular", size: 16.0))
                                    .foregroundColor(TextColor)
                                    .padding(12)
                                    .background(ButtonColor)
                                    .cornerRadius(30)
                            })
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
                                feedbackHeading = "Have Fun! 🎉"
                                feedbackText = "That experience has been added to your schedule."
                            }, label: {
                                HStack {
                                    Text("I'm Down!")
                                    Spacer()
                                    Text(String(timer))
                                        .padding(.horizontal)
                                        .background(Color("Tertiary"))
                                        .cornerRadius(25.0)
                                        .onAppear {
                                            if (timerRunning == false) {
                                                timerRunning = true
                                                let timerAnim = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
                                                    self.timer = self.timer - 1
                                                }
                                            }
                                        }
                                }
                                .padding(.leading, 50.0)
                                .padding(.trailing, 5.0)
                                .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
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
                        NavigationLink(destination: NewExperience(User: User, experience: Experience(id: User.ID.newId(), eventName: "New Experience", host: User.profile, attend: Profile(), date: Date.now, description: lorem, location: "Sydney, 2000", imageName: ""))) {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color.black)
                                .frame(width: 40, height: 40)
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(radius: 10)
                        }.padding()
                    }
                    Spacer()
                    Text(feedbackHeading)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Text(feedbackText)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    Spacer()
                }
                .background(Color("primary"))
            }
        }
    }
}
        

#Preview {
    HomeScreen(
        User: Downer(userKey: "wesleyhahn")
    )
}
