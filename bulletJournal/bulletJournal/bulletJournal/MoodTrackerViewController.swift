//
//  MoodTrackerViewController.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/3/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FSCalendar

class MoodTrackerViewController: UIViewController {
    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate weak var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        calendar.dataSource = self
        //calendar.delegate = self
        view.addSubview(calendar)
        self.calendar = calendar
    }
    
    //MARK: - @IBAction
    @IBAction func showActionSheetButtonTapped(_ sender: UIButton) {
        let myActionSheet = UIAlertController(title: "Test Action Sheet", message: "Different Colors", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let blueAction = UIAlertAction(title: "Blue", style: UIAlertActionStyle.default)
        { (ACTION) in
            sender.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            print("blue button worked!")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default)
        { (ACTION) in
            sender.backgroundColor = #colorLiteral(red: 0.7097254395, green: 0.7098491788, blue: 0.7097176313, alpha: 1)
            print("cancel button worked!")
        }
        
        myActionSheet.addAction(blueAction)
        myActionSheet.addAction(cancelAction)
        
        self.present(myActionSheet, animated: true, completion: nil)
    }
}

    
// MARK:- FSCalendarDataSource
extension MoodTrackerViewController: FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        return cell
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        self.configure(cell: cell, for: date, at: position)
    }
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        if self.gregorian.isDateInToday(date) {
            return "今"
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 2
    }
    
    //MARK: - private functions
    private func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        
        let diyCell = (cell as! MoodCalendarCell)
        // Custom today circle
        diyCell.circleImageView.isHidden = !self.gregorian.isDateInToday(date)
        // Configure selection layer
        if position == .current {
            
            var selectionType = SelectionType.none
            
            if calendar.selectedDates.contains(date) {
                let previousDate = self.gregorian.date(byAdding: .day, value: -1, to: date)!
                let nextDate = self.gregorian.date(byAdding: .day, value: 1, to: date)!
                if calendar.selectedDates.contains(date) {
                    if calendar.selectedDates.contains(previousDate) && calendar.selectedDates.contains(nextDate) {
                        selectionType = .middle
                    }
                    else if calendar.selectedDates.contains(previousDate) && calendar.selectedDates.contains(date) {
                        selectionType = .rightBorder
                    }
                    else if calendar.selectedDates.contains(nextDate) {
                        selectionType = .leftBorder
                    }
                    else {
                        selectionType = .single
                    }
                }
            }
            else {
                selectionType = .none
            }
            if selectionType == .none {
                diyCell.selectionLayer.isHidden = true
                return
            }
            diyCell.selectionLayer.isHidden = false
            diyCell.selectionType = selectionType
            
        } else {
            diyCell.circleImageView.isHidden = true
            diyCell.selectionLayer.isHidden = true
        }
    }
}
