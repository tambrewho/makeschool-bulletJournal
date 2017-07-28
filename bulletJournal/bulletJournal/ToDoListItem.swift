//
//  ToDoListItem.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/28/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation

enum ToDoListItemStatus {
    case notStarted
    case halfDone
    case finished
}


class ToDoListItem {
    var text: String?
    var status: ToDoListItemStatus = .notStarted
}
