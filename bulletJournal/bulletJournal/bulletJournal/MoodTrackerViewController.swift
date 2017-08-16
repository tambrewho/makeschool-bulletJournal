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

class MoodTrackerViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    fileprivate let gregorian = Calendar(identifier: .gregorian)
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    fileprivate let dateHashFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "Mddyyyy"
        return formatter
    }()
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var moodPaletteItem: MoodPaletteView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.register(MoodCalendarCell.self, forCellReuseIdentifier: "cell")
        calendar.dataSource = self
        calendar.delegate = self
        moodPaletteItem.delegate = self
    }

    // MARK:- FSCalendarDataSource
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
        return cell
    }
    
    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        self.configure(cell: cell, for: date, at: position)
    }
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        if self.gregorian.isDateInToday(date) {
            let day = DateFormatter()
            day.dateFormat = "d"
            return day.string(from: date)
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 0
    }
    
    // MARK:- FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendar.frame.size.height = bounds.height
    }
    
    func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition)   -> Bool {
        return monthPosition == .current
    }
    
    func calendar(_ calendar: FSCalendar, shouldDeselect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
        return monthPosition == .current
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("did select date \(self.formatter.string(from: date))")
        self.configureVisibleCells()
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date) {
        print("did deselect date \(self.formatter.string(from: date))")
        self.configureVisibleCells()
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
        if self.gregorian.isDateInToday(date) {
            return [UIColor.orange]
        }
        return [appearance.eventDefaultColor]
    }
    
    //MARK: - private functions
    private func configureVisibleCells() {
        calendar.visibleCells().forEach { (cell) in
            let date = calendar.date(for: cell)
            let position = calendar.monthPosition(for: cell)
            self.configure(cell: cell, for: date!, at: position)
        }
    }
    
    private func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
        
        let moodCell = (cell as! MoodCalendarCell)
        
        let dateHash = dateHashFormatter.string(from: date)
        
        if let moodDateHashItem = MoodRealmHelper.moodAtHash(hash: dateHash) {
            moodCell.mood = moodDateHashItem.moodEnumValue
        } else {
            moodCell.mood = .background
        }
        
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
                moodCell.selectionLayer.isHidden = true
                return
            }
            moodCell.selectionLayer.isHidden = false
            moodCell.selectionType = selectionType
            
        } else {
            moodCell.selectionLayer.isHidden = true
        }
    }
}

extension MoodTrackerViewController: MoodPaletteViewDelegate {
    
    func moodPaletteViewDidSelect(mood: Mood) {
        
        if let selectedDate = calendar.selectedDate {
            let dateHash = dateHashFormatter.string(from: selectedDate)
            MoodRealmHelper.createOrUpdate(mood: mood, at: dateHash)
            calendar.reloadData()
        }
        
    }
    
}
