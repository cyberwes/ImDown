//
//  AreyouDownFill.swift
//  ImDown
//
//  Created by sarah Ahmad Burney on 17/11/2023.
//

import SwiftUI

struct AreyouDownFill: View {
    
    @State private var down="ATTEND"
    @State private var date = Date.now
    @State private var timestart = Date.now
    @State private var timeend = Date.now
    @State private var distance: Double = 5
    let maxDistance = 60.0
    let minDistance = 5.0


    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color("primary"))
            VStack{
                Spacer()
                    .frame(height: 100)
                Text("ARE YOU DOWN?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                
                Picker("ATTEND", selection:$down){
                    Text("ATTEND").tag("ATTEND")
                    Text("HOST").tag("HOST") }
                
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .environment(\.colorScheme, .dark)
                
                if(down=="ATTEND"){
                    HStack {
                        Text("Date")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title3)
                        
                        Spacer()
                        
                        DatePicker(selection: $date, displayedComponents: .date) {}
                            .labelsHidden()
                            .datePickerStyle(.automatic)
                            .background(Color.white)
                            .cornerRadius(8)
                            .shadow(radius: 10)
                        //                           .frame(width: 121.5, height: 30)
                        
                        
                        //                            .padding(.vertical, 4)
                        //
                    }.padding(.horizontal)
                    
                    HStack{
                        
                        VStack{
                            Text("Start Time")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title3)
                            
                            DatePicker(selection: $timestart, displayedComponents: .hourAndMinute){}
                                .labelsHidden()
                                .border(Color.white, width: 180)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                            
                        }
                        
                        
                        Spacer()
                        
                        VStack{
                            Text("End Time")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title3)
                            DatePicker(selection: $timeend, displayedComponents: .hourAndMinute){}
                                .labelsHidden()
                                .border(Color.white, width: 180)
                                .background(Color.white)
                                .cornerRadius(5)
                                .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 2)
                            
                        }
                    }.padding()
                    
                    VStack {
                        Text("Distance")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        Text("Slide across to set the distance radius") .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        Slider(value: $distance, in: minDistance...maxDistance, step: 5)
                            .accentColor(Color("Tertiary"))
                            .padding(.vertical, 5)
                            .padding(.horizontal)
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .padding(.horizontal)
                            .shadow(radius: 10)

    

                                  HStack {
                                      Text("\(Int(distance)) km")
                                          .frame(width: 50, alignment: .leading)
                                          .foregroundColor(.white)
                                          .padding(.horizontal)

                                Stepper("Distance", value: $distance, in: minDistance...maxDistance, step: 5)
                                          .foregroundColor(.white)
                                          .background(Color.white)
                                          .labelsHidden()
                                      
                                  }
                                  .padding()
                                                            
                    } 
                    Spacer()
                    VStack{
                        Text("Let's Go!!")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color("primary"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color .white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .shadow(radius: 10)
                    }.padding()
                }
                else {
                    Spacer()
                    
                    VStack{
                        Text("Create a new Event!!")
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color("primary"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color .white)
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .shadow(radius: 10)
                    
                        Text("Share your skills and inspire others by hosting an event, your knowledge can light up someone's learning journey!")
                            .multilineTextAlignment(.center)
                            .padding(30)
                            .foregroundColor(.white)
                            
                    }
                    
                    Spacer()
                    Spacer()
                    
                }
<<<<<<< HEAD:ImDown/ImDown/AreyouDownFill.swift
               
=======
                Spacer()
>>>>>>> main:ImDown/ImDown/CardsViews/AreyouDownFill.swift
            }
        }
    }
}


#Preview {
    AreyouDownFill()
}
