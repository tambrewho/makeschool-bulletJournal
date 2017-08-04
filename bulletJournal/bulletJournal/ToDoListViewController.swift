//
//  ToDoListViewController.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/28/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    
    var todoItems: [ToDoListItem] = [ToDoListItem()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTableView.dataSource = self
    }

    @IBAction func plusButtonTapped(sender: UIBarButtonItem) {
        todoItems.append(ToDoListItem())
        toDoTableView.reloadData()
    }
    
}

extension ToDoListViewController:  UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as! ToDoTableViewCell
        
        let item = todoItems[indexPath.row]
        cell.todoItem = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if editingStyle == .delete {
                todoItems.remove(at: indexPath.row)
                tableView.reloadData()
            }
        }
    }
}
