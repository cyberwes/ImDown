//
//  AreyouDownFill.swift
//  ImDown
//
//  Created by sarah Ahmad Burney on 17/11/2023.
//

import SwiftUI

struct AreyouDown: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: AreyouDownFill()) {
                Text("ARE YOU DOWN?")
                    .font(Font.custom("SFCompactDisplay-Bold", size: 36.0))
                    .foregroundColor(.white)
                    .frame(width: 1000, height: 2000)
                    .background(Color("primary"))
            }
        }
    }
}

#Preview {
    AreyouDown()
}


