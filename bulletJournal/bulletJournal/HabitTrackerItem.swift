//
//  HabitTrackerItem.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation

class HabitTrackerItem {
    
    var title: String
    var dayItems: [HabitTrackerDay]
    
    init(title: String, dayItems: [HabitTrackerDay] = HabitTrackerDay.entireWeek) {
        self.title = title
        self.dayItems = dayItems
    }
}

class HabitTrackerDay {
    
    var weekday: Weekday
    var selected: Bool = false
    
    init(weekday: Weekday) {
        self.weekday = weekday
    }
    
    static var entireWeek: [HabitTrackerDay] {
        get {
            return [HabitTrackerDay(weekday: .sunday),
                    HabitTrackerDay(weekday: .monday),
                    HabitTrackerDay(weekday: .tuesday),
                    HabitTrackerDay(weekday: .wednesday),
                    HabitTrackerDay(weekday: .thursday),
                    HabitTrackerDay(weekday: .friday),
                    HabitTrackerDay(weekday: .saturday)]
        }
    }
    
}

enum Weekday: String {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}
