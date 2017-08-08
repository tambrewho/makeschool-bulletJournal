//
//  HabitTrackerViewController.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/31/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class HabitTrackerViewController: UIViewController {

    @IBOutlet var HabitTrackerTableView: UITableView!
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    var habitItems: [HabitTrackerItem] = [HabitTrackerItem(title: "Meditate in the morning"),
                                     HabitTrackerItem(title: "Cook Dinner"),
                                     HabitTrackerItem(title: "Drink 8 cups of water")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HabitTrackerTableView.dataSource = self
        setupDateLabel()
    }
    
    private func setupDateLabel() {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d YYYY"
        let fancyText = dateFormatter.string(from: today)
        displayTimeLabel.text = fancyText
    }
    
    @IBAction func addHabitButtonTapped(_ sender: UIBarButtonItem) {
        habitItems.append(HabitTrackerItem(title: ""))
        HabitTrackerTableView.reloadData()
    }
}

extension HabitTrackerViewController:  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return habitItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitTrackerTableViewCell", for: indexPath) as! HabitTrackerTableViewCell
        
        let item = habitItems[indexPath.row]
        cell.habitTrackerItem = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if editingStyle == .delete {
                habitItems.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
    }
}
