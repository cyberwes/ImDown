//
//  ChatView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct ChatView: View {
    var body: some View {
        VStack {
            HStack {
                Text("CHAT")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                
                Spacer()
            }
            .padding()
            ScrollView {
                VStack {
                    HStack {
                        Text("First Last")
                            .font(Font.custom("SFCompactDisplay-Bold", size: 24.0))
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    HStack {
                        Text("Event Hosting/Attending")
                            .font(.body)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                }
                .padding()
                .background(Color.black)
                .cornerRadius(15.0)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ChatView()
}
