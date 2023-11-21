//
//  AttendeeView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct AttendeeView: View {
    
    @State var User: Downer;
    @State var stateManager: StateManager;
    @State var currentExperience: Experience = Experience();
    
    var body: some View {
        if stateManager.currentState != StateManager.State.AttendExperience {
            VStack {
                HStack {
                    Text("UPCOMING")
                        .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                    
                    Spacer()
                }
                .padding()
                ScrollView {
                    ForEach(User.attendExperiences, id: \.self) {experience in
                        Button(action: {
                            currentExperience = experience
                            stateManager.currentState = StateManager.State.AttendExperience
                        }, label: {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(experience.eventName.uppercased())
                                        .font(Font.custom("SFCompactDisplay-Bold", size: 24.0))
                                        .foregroundColor(Color.white)
                                    Spacer()
                                    Text("Hosted by " + experience.host.firstName.capitalized)
                                        .foregroundColor(Color.white)
                                }
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(Color.white)
                                    Text(Formatter.formatDate(experience.date))
                                        .font(Font.custom("SFMono-Regular", size: 16.0))
                                        .foregroundColor(Color.white)
                                    Spacer()
                                }
                                HStack {
                                    Image(systemName: "location")
                                        .foregroundColor(Color.white)
                                    Text(experience.location.uppercased())
                                        .font(Font.custom("SFMono-Regular", size: 16.0))
                                        .foregroundColor(Color.white)
                                    Spacer()
                                }
                                Text(experience.description)
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 2.0);
                            }
                            .padding()
                            .background(Color("primary"))
                            .cornerRadius(15.0)
                        })
                    }
                }
                .padding()
                Spacer()
            }
        }
        else {
            ZStack {
                ExperienceView(experience: currentExperience, User: User)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            stateManager.currentState = StateManager.State.Empty
                        }, label: {
                            Text("Back to upcoming")
                                .foregroundColor(.white)
                                .padding(10.0)
                                .background(Color("primary"))
                                .cornerRadius(20)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        })
                    }
                    Spacer()
                }.padding()
            }
        }
    }
}

#Preview {
    AttendeeView(User: Downer(userKey: "wesleyhahn"), stateManager: StateManager())
}
