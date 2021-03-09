//
//  MainViewModel.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 13/2/21.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    @Published var drugsTaken: Bool = false
    @Published var lastWeeksDisplayDays: [Day] = []
    @Published var todaysName: String = ""
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy"
        return dateFormatter
    }
    
    
    func checkIfDrugsTakenToday() {
        updateTodaysDate()
        drugsTaken = UserDefaults.standard.bool(forKey: todaysName)
    }
    
    
    func updateTodaysDate() {
        let todaysDate = Date().today
        todaysName = dateFormatter.string(from: todaysDate)
    }
    
    
    func updateLastWeeksDisplayDays() {

        let previousWeekDays = Date.previousWeekDays
        for date in previousWeekDays {
            let dateName = dateFormatter.string(from: date)
            let goodDay = UserDefaults.standard.bool(forKey: dateName)
            self.lastWeeksDisplayDays.append(Day(name: dateName, goodDay: goodDay))
        }
    }
}
