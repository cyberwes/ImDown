//
//  HomeScreen.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

var TextColor = Color.white;
var ButtonColor = Color.black;

var eventName = "EVENT NAME";
var host = "Hosted by Sarah";
var date = "21:00 | Wed Nov 9";
var description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
var location = "Suburb, 2000"

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack{
            Image("Baking").resizable().scaledToFill()
            VStack{
                HStack {
                    Text(eventName)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

                    Spacer()
                    
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "line.3.horizontal.decrease")
                                .foregroundColor(Color.black)
                                .frame(width: 40, height: 40)
                            ;
                        }
                    } )
                    .background(Color.white)
                    .cornerRadius(20.0)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
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
                .frame(width: 350)
                Spacer()
                HStack {
                    Spacer()
                    Text(host)
                        .font(.headline)
                        .foregroundColor(TextColor)
                        .padding(12)
                        .background(ButtonColor)
                        .cornerRadius(30)
                }
                .frame(width: 350)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                VStack {
                    HStack {
                        Text(date)
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(TextColor)
                        Spacer()
                    }
                    Text(description)
                        .foregroundColor(TextColor)
                        .padding(.vertical, 4.0);

                    HStack {
                        Text(location)
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(TextColor)
                        Spacer()
                    }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("I'm Down!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(TextColor)
                    })
                    .frame(width: 325, height: 50)
                    .background(ButtonColor)
                    .cornerRadius(25.0)
                    .shadow(radius: 10)
                    .padding(1.0)
                }
                .padding()
                .frame(width:350.0)
                .background(Color(Color(
                    red: 0.5,
                    green: 0.5,
                    blue: 0.5,
                    opacity: 0.4
                )))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .cornerRadius(15.0)
            }
            .padding()
        }
        .padding(.horizontal)
    }
}
        

#Preview {
    HomeScreen()
}
