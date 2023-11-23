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
    var stateManager: StateManager;
    
    @State var feedbackHeading: String = "ARE YOU DOWN?"
    @State var feedbackText: String = "More experiences coming soon!"
    
    @State var timerRunning = true
    
    var body: some View {
        NavigationView {
            if (stateManager.timer > -60 && User.currentExperience.eventName != "") {
                ZStack{
                    Rectangle().fill(.black)
                    User.currentExperience.image.resizable().scaledToFill().opacity(0.75)
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
                            NavigationLink(destination: ProfileView(LoggedInUser: User, User: User.currentExperience.host), label: {
                                Text("Hosted by " + User.currentExperience.host.firstName.capitalized)
                                    .font(Font.custom("SFMono-Regular", size: 16.0))
                                    .foregroundColor(.white)
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
                                stateManager.timer = 0
                                feedbackHeading = "Have Fun! 🎉"
                                feedbackText = "That experience has been added to your schedule."
                            }, label: {
                                HStack {
                                    Text("I'M DOWN!")
                                }
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
                Button(action: {
                    stateManager.currentState = StateManager.State.AreYouDown
                    stateManager.timer = -60
                }, label: {
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Text(feedbackHeading)
                                .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            Text(feedbackText)
                                .foregroundColor(.white)
                                .padding(.horizontal)
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(Color("primary"))
                    .onAppear {
                        if (timerRunning == true) {
                            let returnCheck = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {_ in
                                if stateManager.timer == -10 && stateManager.currentState == StateManager.State.HomeScreen {
                                    stateManager.currentState = StateManager.State.AreYouDown
                                }
                            }
                        }
                    }
                })
            }
        }
    }
}
        

#Preview {
    HomeScreen(User: Downer(userKey: "wesleyhahn"), stateManager: StateManager())
}
