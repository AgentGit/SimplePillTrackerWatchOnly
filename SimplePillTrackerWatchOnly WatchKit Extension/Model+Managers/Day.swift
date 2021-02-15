//
//  Day.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 11/2/21.
//

import Foundation

struct Day: Identifiable {
    var id = UUID()
    let name: String
    let goodDay: Bool
    var imageName: String {
        goodDay ? "checkmark" : "xmark"
    }
    var shortName: String {
        String(name.prefix(11))
    }
}


struct MockData {
    
    static let days = [
        Day(name: "Fri, 12 Feb 2021", goodDay: true),
        Day(name: "Fri, 12 Feb 2021", goodDay: true),
        Day(name: "Wed, 12 Feb 2021", goodDay: true),
        Day(name: "Thu, 12 Feb 2021", goodDay: true),
        Day(name: "Mon, 12 Feb 2021", goodDay: false),
        Day(name: "Tue, 12 Feb 2021", goodDay: true),
        Day(name: "Wed, 12 Feb 2021", goodDay: true)]
}
