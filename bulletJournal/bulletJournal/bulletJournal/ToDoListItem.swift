//
//  ToDoListItem.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/28/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import RealmSwift

enum ToDoListItemStatus: Int {
    case notStarted = 0,
    halfDone,
    finished
}

class ToDoListItem: Object {
    dynamic var text: String? = nil
    dynamic var boxStatus: Int = 0
    dynamic var creationTime = NSDate()
    dynamic var urgentStatus: Bool = false

    var boxStatusEnumValue: ToDoListItemStatus {
        
        get {
            return ToDoListItemStatus(rawValue: boxStatus)!
        }
        
        set {
            boxStatus = newValue.rawValue
        }
        
    }

}
