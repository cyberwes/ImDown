//
//  CarouselAttemptTwo.swift
//  ImDown
//
//  Created by Rahul Ramachandran on 21/11/2023.
//

import SwiftUI

struct CarouselAttemptTwo: View {
    var User: Downer
    var stateManager: StateManager
    @State private var zoomScale: CGFloat = 1.0
    @State private var selectedIndex: Int = -1 // Initial focus on the center card
    
    var randomExperiences: [Experience]
    
    var isButtonEnabled: Bool {
        return selectedIndex >= 0 && selectedIndex < 3
    }
    
    init (User: Downer, stateManager: StateManager) {
        self.User = User
        self.stateManager = stateManager
        self.randomExperiences = User.potentialExperiences
    }
    
    var body: some View {
        VStack {
            Spacer()
            Text("Attend".uppercased()).font(Font.custom("SFCompactDisplay-Bold", size: 36.0)).foregroundStyle(Color("primary")).padding(2).fontWeight(.bold)
            Text("Quick, you have 60 seconds to pick a mystery experience! ").font(.system(size: 20)).multilineTextAlignment(.center).padding(.horizontal, 50)
            ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            CardAltView(experience: randomExperiences[index], isSelected: index == selectedIndex)
                                .tag(index)
                                .scaleEffect(zoomScale)
                                .animation(.easeInOut)
                                .onTapGesture {
                                    withAnimation {
                                        swapCards(index: index, scrollView: scrollView)
                                    }
                                }
                        }
                    }
                    .padding(40)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    //                    .offset(x: -CGFloat(1) * (240 - 20)) // Initial center card position
                }
                .onAppear {
                    scrollView.scrollTo(selectedIndex)
                }
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            zoomScale = value.magnitude
                        }
                        .onEnded { _ in
                            withAnimation {
                                zoomScale = 1.0
                            }
                        }
                )
            }
            Button(action: {
                User.currentExperience = randomExperiences[selectedIndex]
                stateManager.currentState = StateManager.State.SelectedCard
            },
                   label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 35).frame(width: 150, height: 50).foregroundColor((isButtonEnabled ? Color("Tertiary") : Color("Secondary"))).shadow(radius: 5, x: 2, y: 4)
                    HStack {
                        Text("I'm Down!").foregroundColor(.white).font(.system(size: 20))
                        Image(systemName: "arrow.right").foregroundColor(.white)
                    }
                }.padding(20)
            })
            .disabled(!isButtonEnabled)
        }
    }
    
    private func swapCards(index: Int, scrollView: ScrollViewProxy) {
        if index != selectedIndex {
            withAnimation {
                selectedIndex = index
                scrollView.scrollTo(selectedIndex)
            }
        }
    }
}

struct CardAltView: View {
    
    var experience: Experience
    var isSelected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 240, height: 320)
                .foregroundColor(isSelected ? Color("Tertiary") : Color("primary"))
                .shadow(radius: 5, x: 5, y: 10)
            
            VStack {
                HStack {
                    Spacer()
                    Text(experience.location)
                        .foregroundStyle(Color("Secondary"))
                        .font(.system(size: 14))
                }
                .padding(.trailing, 10)
                
                Image("MysteryIcon")
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                
                VStack {
                    Text("Hint:")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                    
                    Text(experience.hint)
                        .foregroundStyle(.white)
                }
                .frame(height: 100, alignment: .top)
                .padding(.leading, 22)
                .padding(.trailing, 22)
                .multilineTextAlignment(.center)
            }
            .frame(width: 240, height: 320)
        }
    }
}

#Preview{
    CarouselAttemptTwo(User: Downer(userKey: "wesleyhahn"), stateManager: StateManager())
}
