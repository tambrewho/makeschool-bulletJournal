//
//  ToDoListViewController.swift
//  bulletJournal
//
//  Created by Tambre Hu on 7/28/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoListViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var displayTimeLabel: UILabel!
    
    var todoItems: Results<ToDoListItem>! {
        didSet {
            toDoTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoTableView.dataSource = self
        setupDateLabel()
        todoItems = ToDoRealmHelper.retrieveToDoItems()
        
        
    }

    private func setupDateLabel() {
        let today = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d YYYY"
        let fancyText = dateFormatter.string(from: today)
        displayTimeLabel.text = fancyText
    }
    
    @IBAction func plusButtonTapped(sender: UIBarButtonItem) {
        let newToDoItem: ToDoListItem = ToDoListItem()
        ToDoRealmHelper.addToDoItem(item: newToDoItem)
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
            ToDoRealmHelper.deleteToDoItem(item: todoItems[indexPath.row])
            todoItems = ToDoRealmHelper.retrieveToDoItems()
        }
    }
}
