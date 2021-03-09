//
//  ContentView.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 11/2/21.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            BackgroundView(drugsTaken: viewModel.drugsTaken)
            
            VStack {
                
                Text(viewModel.todaysName)
                    .fontWeight(.light)
                    .multilineTextAlignment(.leading)
                
                Button {
                    viewModel.drugsTaken.toggle()
                    
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
                        print("UpdateLastWeeksDisplayDays")
                    }
                }
            }
            .onAppear {
                viewModel.checkIfDrugsTakenToday()
                print("Check if drugs taken")
            }
            .onChange(of: scenePhase) { newScenePhase in
                  switch newScenePhase {
                  case .active:
                    print("App is active")
                  case .inactive:
                    UserDefaults.standard.set(viewModel.drugsTaken, forKey: viewModel.todaysName)
                    print("App is inactive")
                    print("viewModel.drugsTaken is \(viewModel.drugsTaken)")
                  case .background:
                    print("App is in background")
                  @unknown default:
                    print("Future proofing only: unexpected new value .onChange of scenePhase")
                  }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["Apple Watch Series 6 - 44mm", "Apple Watch Series 6 - 40mm","Apple Watch Series 5 - 44mm", "Apple Watch Series 5 - 40mm"], id: \.self) { deviceName in
            MainView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}


struct BackgroundView: View {
    
    var drugsTaken: Bool
    
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

//
//struct MyView: View {
//    @ObservedObject var model: DataModel
//    @Environment(\.scenePhase) private var scenePhase
//
//    var body: some View {
//        TimerView()
//            .onChange(of: scenePhase) { phase in
//                model.isTimerRunning = (phase == .active)
//            }
//    }
//}

