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
        VStack {
            HStack {
                Text("HOSTING")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                
                Spacer()
                
                Button(action: {}, label: {
                    VStack{
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(Color.white)
                            .frame(width: 40, height: 40)
                        ;
                    }
                } )
                .background(Color.black)
                .cornerRadius(20)
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
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Edit")
                            }).foregroundColor(.white)
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

#Preview {
    HostView(User: Downer(userKey: "wesleyhahn"))
}
