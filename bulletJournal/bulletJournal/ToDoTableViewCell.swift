//
//  ToDoTableViewCell.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/27/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var weekdayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tanyaButtonTapped(_ sender: UIButton) {
        print("tanya exists!!")
    }

}
