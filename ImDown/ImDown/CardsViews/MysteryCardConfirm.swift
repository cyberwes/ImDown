//
//  MysterycardLayout.swift
//  ImDown
//
//  Created by Tanvi Shah on 17/11/2023.
//

import SwiftUI

struct MysterycardLayout: View {
    
    var User: Downer
    var stateManager: StateManager
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    stateManager.currentState = StateManager.State.Carosel
                }, label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                })
                Spacer()
            }.padding()
            Text("Your Choice".uppercased()).font(Font.custom("SFCompactDisplay-Bold", size: 36.0)).foregroundStyle(Color("primary")).padding(2)
            Text("Once you reveal this exerience you can't go back").font(.system(size: 20)).multilineTextAlignment(.center).padding(.horizontal, 60.0)
            ZStack {
                RoundedRectangle(cornerRadius: 10).frame(width:240, height:320).foregroundStyle(Color("primary")).shadow(radius: 5, x: 5, y: 10)
                VStack {
                    HStack {
                        Spacer()
                        Text (User.currentExperience.location).foregroundStyle(Color("Secondary")).font(.system(size: 14))
                    }.padding(.trailing, 10)
                    Image("MysteryIcon").padding(.top, 10).padding(.bottom, 20)
                    VStack {
                        Text("Hint:").foregroundStyle(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(User.currentExperience.hint).foregroundStyle(.white)
                    }.frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .top).padding(.leading, 22).padding(.trailing, 22).multilineTextAlignment(.center)
                }.frame(width:240, height:320)
            }.padding(40)
            Button(action: {
                stateManager.timer = 0
                stateManager.currentState = StateManager.State.HomeScreen
            },
                   label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 35).frame(width: 135, height: 50).foregroundColor(.black).shadow(radius: 5, x: 2, y: 4)
                    HStack {
                        Text("Reveal").foregroundColor(.white).font(.system(size: 20))
                        Image(systemName: "eye").foregroundColor(.white)
                    }
                }.padding(20)
            })
        }
    }
}

#Preview {
    MysterycardLayout(User: Downer(userKey: "wesleyhahn"), stateManager: StateManager())
}
