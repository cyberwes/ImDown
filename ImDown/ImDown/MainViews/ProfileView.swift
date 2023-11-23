//
//  ProfileView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct ProfileView: View {
    
    var LoggedInUser: Downer
    var User: Profile
    
    var body: some View {
        VStack{
            ZStack{
                Image("Baking").resizable().padding(-10.0).scaledToFit()
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        if LoggedInUser.profile.email == User.email {
                            Button(action: {}, label: {
                                VStack{
                                    Image(systemName: "gear")
                                        .foregroundColor(Color.black)
                                        .frame(width: 40, height: 40)
                                    ;
                                }
                            } )
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        } else {
                            Button(action: {}, label: {
                                VStack{
                                    Image(systemName: "message")
                                        .foregroundColor(Color.black)
                                        .frame(width: 40, height: 40)
                                    ;
                                }
                            } )
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        }
                        Spacer()
                    }.frame(height: 230)
                }.padding()
            }
            
            VStack{
                Image("ProfilePicture").resizable().scaledToFit().clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                                        Circle()
                                            .stroke(Color("primary"), style: StrokeStyle(lineWidth: 8))
                                    )
                Text(User.firstName.capitalized + " " + User.lastName.capitalized)
                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                    .foregroundColor(Color.white).padding(.bottom, 10)
                
                HStack {
                    
                    Text(User.age + " | " + User.pronouns.capitalized + " | ").foregroundColor(Color.white)
                    Image(systemName: "location.fill")
                        .foregroundColor(Color.white)
                    Text(User.location.uppercased())
                        .font(Font.custom("SFMono-Regular", size: 16.0))
                        .foregroundColor(Color.white)
                }
            }
            .offset(y:-55)
            .frame(width: 400, height: 200)
            .background(Color("primary"))
            ScrollView {
                VStack {
                    HStack {
                        Text("INTERESTS")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 20.0))
                            .foregroundColor(Color.primary)
                        Spacer()
                    }
                    Text(User.interests)
                }
                .padding()
                VStack {
                    HStack {
                        Text("BIO")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 20.0))
                        Spacer()
                    }
                    Text(User.about)
                }
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    ProfileView(LoggedInUser: Downer(userKey: "wesleyhahn"), User: Profile(userKey: "wesleyhahn"))
}
