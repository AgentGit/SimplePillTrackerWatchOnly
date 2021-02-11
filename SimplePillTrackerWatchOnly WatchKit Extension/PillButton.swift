//
//  PillButton.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 11/2/21.
//

import SwiftUI

struct PillButton: View {

    var title: String
    var textColour: Color
    var backgroundColour: Color
    
    
    var body: some View {
        Text(title)
            .frame(width: 150.0, height: 50)
            .background(backgroundColour)
            .foregroundColor(textColour)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

struct PillButton_Previews: PreviewProvider {
    static var previews: some View {
        PillButton(title: "Test Title", textColour: .white, backgroundColour: .red)
    }
}
