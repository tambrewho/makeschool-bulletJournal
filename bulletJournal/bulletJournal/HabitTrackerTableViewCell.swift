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
        habitTextView.text = habitTrackerItem.text
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        habitTextView.delegate = self
        
        buttons.forEach({ $0.layer.cornerRadius = 15 })
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonWasTapped(sender: UIButton) {
        print("lol")
        
        
    }
    
}

extension HabitTrackerTableViewCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        habitTrackerItem.text = textView.text
    }
}

