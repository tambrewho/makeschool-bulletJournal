//
//  RealmHelper.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/14/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import RealmSwift

class ToDoRealmHelper {
    //adds To-Do List items to the To-Do List for the weekly planner screen
    static func addToDoItem(item: ToDoListItem) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(item)
        }
    }
    
    static func deleteToDoItem(item: ToDoListItem) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(item)
        }
    }
    
    static func updateToDoItem(itemToBeUpdated: ToDoListItem, newBoxStatus: ToDoListItemStatus) {
        let realm = try! Realm()
        try! realm.write {
            itemToBeUpdated.boxStatus = newBoxStatus.rawValue
        }
    }
    
    static func updateToDoItem(itemToBeUpdated: ToDoListItem, newText: String) {
        let realm = try! Realm()
        try! realm.write {
            itemToBeUpdated.text = newText
        }
    }
    
    static func toggleToDoItemUrgentStatus(itemToBeUpdated: ToDoListItem) {
        let realm = try! Realm()
        try! realm.write {
            itemToBeUpdated.urgentStatus = !itemToBeUpdated.urgentStatus
        }
    }
    
    static func retrieveToDoItems() -> Results<ToDoListItem> {
        let realm = try! Realm()
        return realm.objects(ToDoListItem.self).sorted(byKeyPath: "creationTime")
    }

}
