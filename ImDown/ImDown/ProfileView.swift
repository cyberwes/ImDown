//
//  ProfileView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct ProfileView: View {
    
    var User: Downer;
    
    var body: some View {
        VStack{
            ZStack{
                
                Image("Baking").resizable().padding(-10.0).scaledToFit()
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {}, label: {
                            VStack{
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(Color.black)
                                    .frame(width: 40, height: 40)
                                ;
                            }
                        } )
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        Spacer()
                    }.frame(height: 230)
                }.padding()
            }
            
            VStack{
                
                Text(User.firstName + " " + User.lastName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                HStack {
                    
                    Text(User.age + " | " + User.pronouns + " | " + User.location)
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    
                    Image(systemName: "location.fill")
                        .foregroundColor(Color.white)
                }
            }
            .frame(width: 400, height: 150)
            .background(Color("primary"))
            VStack {
                HStack {
                    Text("ABOUT")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.leading, 25.0)
                    Spacer()
                }
                Text(User.about)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ProfileView(User: Downer())
}
