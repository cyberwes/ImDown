//
//  CarouselAttemptTwo.swift
//  ImDown
//
//  Created by Rahul Ramachandran on 21/11/2023.
//

import SwiftUI

struct CarouselAttemptTwo: View {
    @State private var zoomScale: CGFloat = 1.0
    @State private var selectedIndex = 1 // Initial focus on the center card

    var body: some View {
        VStack {
            Text("Attend").font(.system(size: 40)).foregroundStyle(Color("primary")).padding(2).fontWeight(.bold)
            Text("Select a card based on the hints").font(.system(size: 20)).multilineTextAlignment(.center)
            Text("Careful! You can only choose one. ").font(.system(size: 20)).multilineTextAlignment(.center)
            ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(0..<3) { index in
                            CardAltView()
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
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 240, height: 320)
                .foregroundStyle(Color("primary"))
                .shadow(radius: 5, x: 5, y: 10)
            
            VStack {
                HStack {
                    Spacer()
                    Text("1.7km away")
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
                    
                    Text("You can eat what you make")
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
    CarouselAttemptTwo()
}
