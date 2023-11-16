//
//  AttendeeView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct AttendeeView: View {
    
    @State var User: Downer;
    
    var body: some View {
        VStack {
            HStack {
                Text("UPCOMING")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            ScrollView {
                ForEach(User.attendExperiences, id: \.self) {experience in
                    VStack {
                        HStack {
                            Text(experience.eventName.uppercased())
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Spacer()
                            Text("Hosted by " + experience.host)
                                .foregroundColor(Color.white)
                        }
                        HStack {
                            Text(experience.date)
                                .font(.body)
                                .fontWeight(.light)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        HStack {
                            Text(experience.description)
                                .foregroundColor(Color.white)
                                .padding(.vertical, 2.0);
                        }
                        HStack {
                            Text(experience.location)
                                .font(.body)
                                .fontWeight(.light)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(15.0)
                }
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    AttendeeView(User: Downer())
}
