//
//  ContentView.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 11/2/21.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            BackgroundView(drugsTaken: $viewModel.drugsTaken)
            
            VStack {
                
                Text(viewModel.todaysName)
                    .fontWeight(.light)
                    .multilineTextAlignment(.trailing)
                
                Button {
                    viewModel.drugsTaken.toggle()
                    UserDefaults.standard.set(viewModel.drugsTaken, forKey: viewModel.todaysName)
                } label: {
                    PillButton(drugsTaken: $viewModel.drugsTaken,
                               title: viewModel.drugsTaken ? "Done!" : "Take Drugs!",
                               textColour: .white,
                               backgroundColour: .red)
                }
                .padding(20)
                .contentShape(Rectangle())
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.lastWeeksDisplayDays) { day in
                            PreviousDay(day: day)
                        }
                    }
                    .onAppear {
                        viewModel.updateLastWeeksDisplayDays()
                    }
                }
            }
            .onAppear {
                viewModel.checkIfDrugsTaken()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
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


struct PreviousDay: View {
    
    var day: Day
    
    var body: some View {
        HStack {
            Image(systemName: day.imageName)
            Text(day.shortName)
                .font(.title3)
                .foregroundColor(day.goodDay ? .green : .gray)
        }
    }
}
