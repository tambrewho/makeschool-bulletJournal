//
//  HabitTrackerTableViewCell.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class HabitTrackerTableViewCell: UITableViewCell {

    @IBOutlet weak var habitTextView: UITextView!
    @IBOutlet var buttons: [UIButton]!
    
    var habitTrackerItem: HabitTrackerItem! {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        habitTextView.text = habitTrackerItem.title
        
        for index in 0..<habitTrackerItem.dayItems.count {
            
            let button = buttons[index]
            let dayItem = habitTrackerItem.dayItems[index]
            
            if dayItem.selected {
                //green
                button.backgroundColor = UIColor(red: 102/255, green: 250/255, blue: 51/255, alpha: 0.2)
            } else {
                button.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.2)
            }
        }
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        habitTextView.delegate = self
        
        buttons.forEach({ $0.layer.cornerRadius = 21.5 })
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonWasTapped(sender: UIButton) {
        updateViews()
        print("weekday button was tapped")
        
        let buttonIndex = buttons.index(of: sender)!
        print(buttonIndex)
        print(habitTrackerItem)
        let dayItem = habitTrackerItem.dayItems[buttonIndex]
        
        dayItem.selected = !dayItem.selected
        
        if dayItem.selected {
            //green
            sender.backgroundColor = UIColor(red: 102/255, green: 250/255, blue: 51/255, alpha: 0.2)
        } else {
            sender.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 255/255, alpha: 0.2)
        }
        
    }
    
}

extension HabitTrackerTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        habitTrackerItem.title = textView.text
    }
}

