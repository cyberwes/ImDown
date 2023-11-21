//
//  MysterycardLayout.swift
//  ImDown
//
//  Created by Tanvi Shah on 17/11/2023.
//

import SwiftUI

struct MysterycardLayout: View {
    var body: some View {
        VStack {
            Text("You're in!").font(.system(size: 40)).foregroundStyle(Color("primary")).padding(2).fontWeight(.bold)
            Text("Stepping out of your comfort").font(.system(size: 20)).multilineTextAlignment(.center)
            Text("zone is huge. We’re proud of you.").font(.system(size: 20)).multilineTextAlignment(.center)
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
    MysterycardLayout()
}
