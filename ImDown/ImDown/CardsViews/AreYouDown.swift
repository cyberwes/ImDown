//
//  AreyouDownFill.swift
//  ImDown
//
//  Created by sarah Ahmad Burney on 17/11/2023.
//
//
//
import SwiftUI

struct AreyouDown: View {
    
    @State private var isAnimating = false
    var user: Downer
    var stateManager: StateManager

    var body: some View {
        VStack {
            Text("⚡️New Experiences⚡️").font(Font.custom("SFCompactDisplay-Bold", size: 16.0)).foregroundColor(.white)
            Button(action: {
                stateManager.currentState = StateManager.State.Experience
            }, label: {
                Text("ARE YOU DOWN?!")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                    .foregroundColor(Color("primary"))
                    .frame(width: 330, height: 60)
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(radius: isAnimating ? 20 : 10)
                    .scaleEffect(isAnimating ? 1.1 : 1.0)
                    .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isAnimating)
            })
            .onAppear {
                isAnimating = true
            }
            HStack {
                Spacer()
                Button(action: {
                    stateManager.currentMode = .Attend
                    stateManager.currentState = .Experience

                }, label: {
                    Text("Join").font(Font.custom("SFCompactDisplay-Bold", size: 24.0)).foregroundColor(Color("primary"))
                        .padding(10.0)
                        .background(.white)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0)
                })
                Spacer()
                Button(action: {
                    stateManager.currentMode = .Host
                    stateManager.currentState = .Experience

                }, label: {
                    Text("Host").font(Font.custom("SFCompactDisplay-Bold", size: 24.0)).foregroundColor(Color("primary"))
                        .padding(10.0)
                        .background(.white)
                        .cornerRadius(15.0)
                        .shadow(radius: 10.0)
                })
                Spacer()
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("primary"))
    }
}

#Preview {
        AreyouDown(user: Downer(userKey: "wesleyhahn"), stateManager: StateManager())
    
}
