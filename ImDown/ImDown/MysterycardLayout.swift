//
//  MysterycardLayout.swift
//  ImDown
//
//  Created by Tanvi Shah on 17/11/2023.
//

import SwiftUI

struct MysterycardLayout: View {
    var body: some View {
        
        ZStack {
//            Rectangle().frame(width:240, height:320)
            RoundedRectangle(cornerRadius: 10).frame(width:240, height:320).foregroundStyle(Color("primary"))
            VStack {
                Text("You're In!")
                HStack
                {
                    Spacer()
                    Text ("1.7km away").foregroundStyle(.white)
                }.padding(20)
                    Image("MysteryIcon")
                Text("Hint:").foregroundStyle(.white)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("You can eat what you make").foregroundStyle(.white)
                Spacer()
            }.frame(width:240, height:320)
        }
    }
}

#Preview {
    MysterycardLayout()
}
