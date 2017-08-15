//
//  HabitTrackerItem.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import RealmSwift

class HabitTrackerItem: Object {
    
    dynamic var title: String = ""
    dynamic var creationTime = NSDate()
    let dayItems = List<HabitTrackerDay>()
    
    convenience init(title: String, dayItems: [HabitTrackerDay] = HabitTrackerDay.entireWeek) {
        self.init()
        self.title = title
        
        for dayItem in dayItems {
            self.dayItems.append(dayItem)
        }
    }
}

class HabitTrackerDay: Object {
    
    dynamic var weekday: String = ""
    dynamic var selected: Bool = false
    
    convenience init(weekday: Weekday) {
        self.init()
        self.weekday = weekday.rawValue
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
    
    var weekdayAsEnum: Weekday {
        
        get {
            return Weekday(rawValue: weekday)!
        }
        set {
            weekday = newValue.rawValue
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



