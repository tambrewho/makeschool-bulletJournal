//
//  HabitRealmHelper.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/15/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import RealmSwift

class HabitRealmHelper {
    
    static func addHabitItem(item: HabitTrackerItem) {
        let realm = try! Realm()
        try! realm.write() {
            
            realm.add(item)
            
            for dayItem in item.dayItems {
                realm.add(dayItem)
            }
            
        }
    }
    
    static func deleteHabitItem(item: HabitTrackerItem) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(item)
        }
    }
    
    static func updateHabitItem(itemToBeUpdated: HabitTrackerItem, newText: String) {
        let realm = try! Realm()
        try! realm.write {
            itemToBeUpdated.title = newText
        }
    }
    
    static func invertDayItemSelectionStatus(itemToBeUpdated: HabitTrackerDay) {
        let realm = try! Realm()
        try! realm.write {
            itemToBeUpdated.selected = !itemToBeUpdated.selected
        }
    }
    
    static func retrieveHabitItems() -> Results<HabitTrackerItem> {
        let realm = try! Realm()
        return realm.objects(HabitTrackerItem.self).sorted(byKeyPath: "creationTime")
    }
}
