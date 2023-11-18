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
            Image("Baking").resizable().padding(.vertical, -10.0).scaledToFit()
            
            VStack{
                
                Text(User.firstName + " " + User.lastName)
                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                    .foregroundColor(Color.white)
                
                HStack {
                    
                    Text(User.age + " | " + User.pronouns + " | " + User.location)
                        .font(Font.custom("SFMono-Regular", size: 16.0))
                        .foregroundColor(Color.white)
                    
                    Image(systemName: "location.fill")
                        .foregroundColor(Color.white)
                }
                HStack {
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
                }
            }
            .frame(width: 400, height: 150)
            .background(Color("primary"))
            VStack {
                HStack {
                    Text("ABOUT")
                        .font(Font.custom("SFCompactDisplay-Bold", size: 16.0))
                        .padding(.leading, 20.0)
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
    ProfileView(User: Downer(userKey: "wesleyhahn"))
}
