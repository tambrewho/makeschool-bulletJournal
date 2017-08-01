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
        switch todoItem.status {
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
    
        if todoItem.status == .notStarted {
            todoItem.status = .halfDone
        }
        
        else if todoItem.status == .halfDone {
            todoItem.status = .finished
        }
        
        else if todoItem.status == .finished {
            todoItem.status = .notStarted
        }
        
        updateCheckButton()
    }
    
}

extension ToDoTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        todoItem.text = textView.text
    }
    
}
