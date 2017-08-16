//
//  MoodRealmHelper.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/15/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import RealmSwift

class MoodRealmHelper {
    
    static func moodAtHash(hash: String) -> MoodDateItem? {
        let realm = try! Realm()
        return realm
               .objects(MoodDateItem.self)
               .filter({ $0.dateHash == hash })
               .first
    }
    
    static func createOrUpdate(mood: Mood, at hash: String) {
        let realm = try! Realm()
        
        //hash exists
        if let moodDateItem = MoodRealmHelper.moodAtHash(hash: hash) {
            try! realm.write() {
                moodDateItem.moodEnumValue = mood
            }
        }
        else {
            try! realm.write() {
                let newMoodDateItem = MoodDateItem(dateHash: hash, mood: mood)
                realm.add(newMoodDateItem)
            }
        }
    }
    
}
