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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HabitTrackerTableView.dataSource = self
    }
    
    @IBAction func addHabitButtonTapped(_ sender: UIBarButtonItem) {
        print("add habit button tapped")
    }
    
    
    
}

extension HabitTrackerViewController:  UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitTrackerTableViewCell", for: indexPath) as! HabitTrackerTableViewCell
        
        return cell
    }
}
