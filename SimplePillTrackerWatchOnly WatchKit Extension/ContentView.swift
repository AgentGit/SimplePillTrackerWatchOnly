//
//  ContentView.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 11/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var drugsTaken = false
    
    var body: some View {
        
        ZStack {
            
            BackgroundView(drugsTaken: $drugsTaken)
            
            VStack {
                
                Text("Wednesday 16th")
                    .fontWeight(.light)
                    .multilineTextAlignment(.trailing)
                
                Button {
                    drugsTaken.toggle()
                } label: {
                    PillButton(drugsTaken: $drugsTaken,
                               title: drugsTaken ? "Done!" : "Take Drugs!",
                               textColour: .white,
                               backgroundColour: .red)
                    // .padding(30)
                    
                }
                //                .contentShape(Rectangle())
                
                ScrollView {
                    VStack {
                        ForEach(0..<7) { item in
                            Text("Took Pills")
                                .font(.title3)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct BackgroundView: View {
    
    @Binding var drugsTaken: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.black,
                                                   drugsTaken ? .green : .red]),
                       startPoint: .top,
                       endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}
