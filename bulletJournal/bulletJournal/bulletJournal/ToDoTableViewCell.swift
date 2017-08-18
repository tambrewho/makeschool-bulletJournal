//
//  ToDoTableViewCell.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/27/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var urgentButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var taskTextView: UITextView!
    
    var todoItem: ToDoListItem! {
        didSet {
           updateViews()
        }
    }
    
    private func updateViews() {
        taskTextView.text = todoItem.text
        updateCheckButton()
        updateUrgentButton()
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
    
    private func updateUrgentButton() {
        if todoItem.urgentStatus == true {
            urgentButton.setImage(UIImage(named: "explanationMarkFilled"), for: .normal)
        } else {
            urgentButton.setImage(UIImage(named: "explanationMark"), for: .normal)
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
            ToDoRealmHelper.updateToDoItem(itemToBeUpdated: todoItem,
                                       newBoxStatus: .halfDone)
        }
        
        else if todoItem.boxStatusEnumValue == .halfDone {
           ToDoRealmHelper.updateToDoItem(itemToBeUpdated: todoItem,
                                       newBoxStatus: .finished)
        }
        
        else if todoItem.boxStatusEnumValue == .finished {
            ToDoRealmHelper.updateToDoItem(itemToBeUpdated: todoItem,
                                       newBoxStatus: .notStarted)
        }
        updateCheckButton()
    }
    
    @IBAction func urgentButtonTapped(_ sender: UIButton) {
        if todoItem.urgentStatus == true {
            sender.setImage(UIImage(named: "explanationMark"), for: .normal)
            ToDoRealmHelper.toggleToDoItemUrgentStatus(itemToBeUpdated: todoItem)
        } else {
            sender.setImage(UIImage(named: "explanationMarkFilled"), for: .normal)
            ToDoRealmHelper.toggleToDoItemUrgentStatus(itemToBeUpdated: todoItem)
        }
        print("urgent button tapped")
    }
    
}

extension ToDoTableViewCell: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        ToDoRealmHelper.updateToDoItem(itemToBeUpdated: todoItem, newText: textView.text)
    }
    
}
