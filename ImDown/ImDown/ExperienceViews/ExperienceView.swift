//
//  Experience.swift
//  ImDown
//
//  Created by Wesley Hahn on 18/11/2023.
//

import SwiftUI

struct ExperienceView: View {
    @State var experience: Experience
    var User: Downer
    
    var body: some View {
        NavigationView {
            if (experience.eventName != "") {
                ZStack{
                    experience.image.resizable().scaledToFill()
                    VStack{
                        VStack{
                            HStack {
                                Text(experience.eventName.uppercased())
                                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                                    .foregroundColor(Color.white)
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                Spacer()
                            }
                        }
                        .frame(width: width)
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundColor(Color.white)
                            Text(Formatter.formatDate(experience.date))
                                .font(Font.custom("SFMono-Regular", size: 16.0))                            .foregroundColor(Color.white)
                            Spacer()
                        }
                        .frame(width: width)
                        .shadow(radius: 4)
                        HStack {
                            Image(systemName: "location")
                                .foregroundColor(Color.white)
                            Text(experience.location.uppercased())
                                .font(Font.custom("SFMono-Regular", size: 16.0))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        .frame(width: width)
                        .shadow(radius: 4)
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Hosted by " + experience.host.firstName)
                                .font(Font.custom("SFMono-Regular", size: 16.0))
                                .foregroundColor(TextColor)
                                .padding(12)
                                .background(ButtonColor)
                                .cornerRadius(30)
                        }
                        .frame(width: width)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        VStack {
                            HStack {
                                Text(experience.description)
                                    .fontWeight(.semibold)
                                    .foregroundColor(TextColor)
                                    .padding(.vertical, 4.0);
                            }
                            .shadow(radius: 4.0)
                            Button(action: {
                                User.unattend(experience: experience)
                                self.experience = Experience(id: User.ID.newId(), eventName: "", host: Profile(), attend: Profile(), date: Date.now, description: "", location: "", imageName: "")
                            }, label: {
                                Text("I'm Out 😔")
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
            } else {
                ZStack {
                    Rectangle().foregroundColor(Color("primary"))
                    VStack {
                        Text("SAD TO SEE YOU GO!")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                            .foregroundColor(.white)
                        Text("We'll let the host know that you've cancelled.")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    ExperienceView(experience: Downer(userKey: "wesleyhahn").currentExperience, User: Downer(userKey: "wesleyhahn"))
}
