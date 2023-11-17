//
//  AreyouDownFill.swift
//  ImDown
//
//  Created by sarah Ahmad Burney on 17/11/2023.
//

import SwiftUI

struct AreyouDown: View {
    var body: some View {
        VStack{
            Text("ARE YOU DOWN?")
                .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("primary"))
       
        }
    
}

#Preview {
    AreyouDown()
}


