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
    
    var habitItems: [HabitTrackerItem] = [HabitTrackerItem(title: "Cardio"),
                                     HabitTrackerItem(title: "Weights"),
                                     HabitTrackerItem(title: "Cooking")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HabitTrackerTableView.dataSource = self
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
}
