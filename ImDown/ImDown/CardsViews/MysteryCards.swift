//
//  MysteryCards.swift
//  ImDown
//
//  Created by Rahul Ramachandran on 17/11/2023.
//

import SwiftUI

struct MysteryCards: View {
    var body: some View {
        VStack {
            Text("Attend").font(.system(size: 40)).foregroundStyle(Color("primary")).padding(2).fontWeight(.bold)
            Text("Select a card based on the hints").font(.system(size: 20)).multilineTextAlignment(.center)
            Text("Careful! You can only choose one. ").font(.system(size: 20)).multilineTextAlignment(.center)
            ZStack {
                RoundedRectangle(cornerRadius: 10).frame(width:240, height:320).foregroundStyle(Color("primary")).shadow(radius: 5, x: 5, y: 10)
                VStack {
                    HStack {
                        Spacer()
                        Text ("1.7km away").foregroundStyle(Color("Secondary")).font(.system(size: 14))
                    }.padding(.trailing, 10)
                    Image("MysteryIcon").padding(.top, 10).padding(.bottom, 20)
                    VStack {
                        Text("Hint:").foregroundStyle(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("You can eat what you make").foregroundStyle(.white)
                    }.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .top).padding(.leading, 22).padding(.trailing, 22).multilineTextAlignment(.center)
                }.frame(width:240, height:320)
            }.padding(40)
            Button(action: {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            },
                   label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 35).frame(width: 150, height: 50).foregroundColor(Color("primary")).shadow(radius: 5, x: 2, y: 4)
                    HStack {
                        Text("I'm Down!").foregroundColor(.white).font(.system(size: 20))
                        Image(systemName: "arrow.right").foregroundColor(.white)
                    }
                }.padding(20)
            })
        }
    }
}

#Preview {
    MysteryCards()
}
