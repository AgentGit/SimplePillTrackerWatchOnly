//
//  PillButton.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 11/2/21.
//

import SwiftUI

struct PillButton: View {

    @Binding var drugsTaken: Bool
    
    var title: String
    var textColour: Color
    var backgroundColour: Color
    
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "pills.fill")
                .foregroundColor(drugsTaken ? Color.green : Color.red)
                .font(.largeTitle)
            
            Text(title)
                .frame(width: 100.0, height: 60)
                .background(drugsTaken ? Color.green : Color.red)
                .foregroundColor(textColour)
                .font(.system(size: 20, weight: .bold, design: .default))
                .cornerRadius(10)
        }
    }
}

struct PillButton_Previews: PreviewProvider {
    static var previews: some View {
        PillButton(drugsTaken: .constant(true), title: "Take Drugs", textColour: .white, backgroundColour: .red)
    }
}
