//
//  ChatView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct ChatView: View {
    
    var User: Downer
    
    var body: some View {
        VStack {
            HStack {
                Text("CHAT")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                
                Spacer()
            }
            .padding()
            ScrollView {
                ForEach(User.attendExperiences, id: \.self) {experience in
                    VStack {
                        HStack {
                            Text(experience.host.firstName.uppercased())
                                .font(Font.custom("SFCompactDisplay-Bold", size: 24.0))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        HStack {
                            Text(experience.eventName)
                                .font(.body)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                    }
                    .padding()
                    .background(Color("primary"))
                    .cornerRadius(15.0)
                }
                ForEach(User.hostExperiences, id: \.self) {experience in
                    VStack {
                        HStack {
                            Text(experience.attendee.firstName.uppercased())
                                .font(Font.custom("SFCompactDisplay-Bold", size: 24.0))
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        HStack {
                            Text(experience.eventName)
                                .font(.body)
                                .foregroundColor(Color.white)
                            Spacer()
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

#Preview {
    ChatView(User: Downer(userKey: "wesleyhahn"))
}
