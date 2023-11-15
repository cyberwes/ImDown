//
//  HomeScreen.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

var TextColor = Color.white;
var ButtonColor = Color.black;

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack{
            Image("Baking").resizable().scaledToFill()
            VStack{
                HStack {
                    Text("EVENT NAME")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
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
                }
                .frame(width: 350)
                Spacer()
                HStack {
                    Spacer()
                    Text("Hosted by Sarah")
                        .font(.headline)
                        .padding(12.0)
                        .foregroundColor(TextColor)
                        .background(ButtonColor)
                        .cornerRadius(15)
                }
                .frame(width: 350)
                VStack {
                    HStack {
                        Text("Time | Date")
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .foregroundColor(Color.black)
                        .padding(.vertical, 4.0);

                    HStack {
                        Text("Suburb Location")
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(Color.black)
                        Spacer()
                    }
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("I'm Down!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(TextColor)
                    })
                    .frame(width: 325, height: 40)
                    .background(ButtonColor)
                    .cornerRadius(20.0)
                    .padding(1.0)
                }
                .padding()
                .frame(width:350.0)
                .background(Color(Color.white))
                .cornerRadius(15.0)
            }
            .padding([.top, .leading, .trailing])
        }
        .padding(.horizontal)
    }
}
        

#Preview {
    HomeScreen()
}
