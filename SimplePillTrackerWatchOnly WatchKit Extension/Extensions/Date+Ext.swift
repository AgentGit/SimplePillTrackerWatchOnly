//
//  Date+Ext.swift
//  SimplePillTrackerWatchOnly WatchKit Extension
//
//  Created by Chad Goodyear on 15/2/21.
//

import Foundation

extension Date {
    static var previousWeekDays: [Date] { return [Date().oneDayBefore,
                                                  Date().twoDaysBefore,
                                                  Date().threeDaysBefore,
                                                  Date().fourDaysBefore,
                                                  Date().fiveDaysBefore,
                                                  Date().sixDaysBefore] }
    
    var today: Date {
        return Calendar.current.date(byAdding: .day, value: 0, to: noon)!
    }
    
    var oneDayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    
    var twoDaysBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -2, to: noon)!
    }
    
    var threeDaysBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -3, to: noon)!
    }
    
    var fourDaysBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -4, to: noon)!
    }
    
    var fiveDaysBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -5, to: noon)!
    }
    
    var sixDaysBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -6, to: noon)!
    }
    
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
}
