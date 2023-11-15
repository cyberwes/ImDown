//
//  AttendeeView.swift
//  ImDown
//
//  Created by Wesley Hahn on 15/11/2023.
//

import SwiftUI

struct AttendeeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("UPCOMING")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
            ScrollView {
                VStack {
                    HStack {
                        Text("Event Name")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                        Text("Hosted by Sarah")
                            .foregroundColor(Color.white)
                    }
                    HStack {
                        Text("Time | Date")
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .foregroundColor(Color.white)
                        .padding(.vertical, 4.0);

                    HStack {
                        Text("Suburb Location")
                            .font(.body)
                            .fontWeight(.light)
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
    AttendeeView()
}
