//
//  MoodDateItem.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/15/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import RealmSwift

class MoodDateItem: Object {
    dynamic var dateHash: String = ""
    dynamic var mood: String = ""
    
    //gets enum value
    var moodEnumValue : Mood {
        get {
            return Mood(rawValue: mood)!
        }
        set {
            mood = newValue.rawValue
        }
    }
    
    convenience init(dateHash: String, mood: Mood) {
        self.init()
        self.dateHash = dateHash
        self.moodEnumValue = mood
    }
    
}
