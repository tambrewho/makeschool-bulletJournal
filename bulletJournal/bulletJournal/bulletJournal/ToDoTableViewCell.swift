//
//  ToDoTableViewCell.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/27/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var taskTextView: UITextView!
    
    var todoItem: ToDoListItem! {
        didSet {
           updateViews()
        }
    }
    
    private func updateViews() {
        updateCheckButton()
        taskTextView.text = todoItem.text
    }
    
    private func updateCheckButton() {
        switch todoItem.boxStatusEnumValue {
        case .notStarted:
            checkButton.setBackgroundImage(UIImage(named: "CheckBox"), for: .normal)
        case .halfDone:
            checkButton.setBackgroundImage(UIImage(named: "DashedBox"), for: .normal)
        case .finished:
            checkButton.setBackgroundImage(UIImage(named: "DoubleDashedBox"), for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        taskTextView.delegate = self
        taskTextView.layer.cornerRadius = 4
    }

    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        print("check button tapped")
    
        if todoItem.boxStatusEnumValue == .notStarted {
            RealmHelper.updateToDoItem(itemToBeUpdated: todoItem,
                                       newBoxStatus: .halfDone)
        }
        
        else if todoItem.boxStatusEnumValue == .halfDone {
            RealmHelper.updateToDoItem(itemToBeUpdated: todoItem,
                                       newBoxStatus: .finished)
        }
        
        else if todoItem.boxStatusEnumValue == .finished {
            RealmHelper.updateToDoItem(itemToBeUpdated: todoItem,
                                       newBoxStatus: .notStarted)
        }
        updateCheckButton()
    }
    
    @IBAction func urgentButtonTapped(_ sender: UIButton) {
        //urgent button not tapped
        if todoItem.urgentStatus == false {
            sender.setImage(UIImage(named: "explanationMarkFilled"), for: .normal)
            RealmHelper.toggleToDoItemUrgentStatus(itemToBeUpdated: todoItem)
        //urgent button tapped
        } else {
            sender.setImage(UIImage(named: "explanationMark"), for: .normal)
            RealmHelper.toggleToDoItemUrgentStatus(itemToBeUpdated: todoItem)
        }
        print("urgent button tapped")
    }
    
}

extension ToDoTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        RealmHelper.updateToDoItem(itemToBeUpdated: todoItem, newText: textView.text)
    }
    
}
