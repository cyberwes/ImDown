//
//  HostView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct HostView: View {
    
    var User: Downer;
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("HOSTING")
                        .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                    
                    Spacer()
                    
                    NavigationLink(destination: NewExperience(User: User, experience: Experience(id: User.ID.newId(), eventName: "Experience Name", host: Downer(userKey: "wesleyhahn").profile, attend: Profile(), date: Date.now, description: lorem, location: "Sydney, 2000", imageName: ""))) {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(Color.black)
                            .frame(width: 40, height: 40)
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: 10)
                    }
                }
                .padding()
                ScrollView {
                    ForEach(User.hostExperiences, id: \.self) {experience in
                        
                        VStack {
                            HStack {
                                Text(experience.eventName.uppercased())
                                    .font(Font.custom("SFCompactDisplay-Bold", size: 24.0))
                                    .foregroundColor(Color.white)
                                Spacer()
                                Button(action: {
                                    User.unhost(experience: experience)
                                }, label: {
                                    Text("Delete")
                                        .foregroundColor(Color.black)
                                        .frame(width: 80, height: 30)
                                        .background(Color.white)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                })
                                NavigationLink(destination: NewExperience(User: User, experience: experience)) {
                                    Text("Edit")
                                        .foregroundColor(Color.black)
                                        .frame(width: 60, height: 30)
                                        .background(Color.white)
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                }
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
                            HStack {
                                Text(experience.description)
                                    .foregroundColor(Color.white)
                                    .padding(.vertical, 2.0);
                            }
                        }
                        .padding()
                        .background(Color("primary"))
                        .cornerRadius(15.0)
                    }
                }
                .padding()
                Spacer()
            }
        }
    }
}

#Preview {
    HostView(User: Downer(userKey: "wesleyhahn"))
}
