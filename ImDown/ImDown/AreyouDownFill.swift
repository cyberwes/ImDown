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
                
                
                Picker("ATTEND", selection:$down){
                    Text("ATTEND").tag("ATTEND")
                    Text("HOST").tag("HOST")
                        
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if(down=="ATTEND"){
                    HStack {
                        Text("Date")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        DatePicker(selection: $date, displayedComponents: .date) {}.frame(width:180 ,height: 30)
                        
                    }.padding(.horizontal)
                }
                else {
                    Text("Host")
                }
                
                
                Spacer()
                
                
            }
        }
    }
}
#Preview {
    AreyouDownFill()
}
