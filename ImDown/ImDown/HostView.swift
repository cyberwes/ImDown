//
//  HostView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct HostView: View {
    
    var experienceArray: [Experience];
    
    var body: some View {
        VStack {
            HStack {
                Text("HOSTING")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
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
                ForEach(experienceArray, id: \.self) {experience in
                    
                    VStack {
                        HStack {
                            Text(experience.eventName.uppercased())
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Edit")
                            })
                        }
                        HStack {
                            Text(experience.date)
                                .font(.body)
                                .fontWeight(.light)
                                .foregroundColor(Color.white)
                            Spacer()
                        }
                        Text(experience.description)
                            .foregroundColor(Color.white)
                            .padding(.vertical, 4.0);
                        
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
    HostView(experienceArray: Downer().hostExperiences)
}
