//
//  ProfileView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Image("Baking").resizable().padding(.vertical, -10.0).scaledToFit()
            VStack{
                Text("Wesley Hahn")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                HStack {
                    Text("28 | he/him | Rosebery 2018")
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    Image(systemName: "location.fill")
                        .foregroundColor(Color.white)
                }
            }
            .frame(width: 400, height: 150)
            .background(Color.black)
            VStack {
                HStack {
                    Text("ABOUT")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.leading, 25.0)
                    Spacer()
                }
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.")
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
}
