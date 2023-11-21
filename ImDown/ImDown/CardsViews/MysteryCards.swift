//
//  MysteryCards.swift
//  ImDown
//
//  Created by Rahul Ramachandran on 17/11/2023.
//

import SwiftUI

struct MysteryCards: View {
    var body: some View {
        VStack{
            Text("Attend").foregroundStyle(.blue)
            Text("Select a card based on the hints")
            Text("Careful! You can only choose one. ")
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

#Preview {
    MysteryCards()
}
