//
//  MoodTrackerViewController.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/3/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import EventKit

class MoodTrackerViewController: UIViewController, CalendarViewDataSource, CalendarViewDelegate {
    
    @IBOutlet weak var calendarView: CalendarView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        viewDidAppear(true)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        calendarView.dataSource = self
        calendarView.delegate = self
        
        // change the code to get a vertical calender.
        calendarView.direction = .horizontal
        
        var tomorrowComponents = DateComponents()
        tomorrowComponents.day = 1
        
        let today = Date()
        
        
        if let tomorrow = (self.calendarView.calendar as NSCalendar).date(byAdding: tomorrowComponents, to: today, options: NSCalendar.Options()) {
            self.calendarView.selectDate(tomorrow)
            //self.calendarView.deselectDate(date)
            
        }
        
        self.calendarView.setDisplayDate(today, animated: false)
    }
    
    // MARK : KDCalendarDataSource
    
    func startDate() -> Date? {
        
        var dateComponents = DateComponents()
        dateComponents.month = -3
        
        let today = Date()
        
        let threeMonthsAgo = (self.calendarView.calendar as NSCalendar).date(byAdding: dateComponents, to: today, options: NSCalendar.Options())
        
        
        return threeMonthsAgo
    }
    
    func endDate() -> Date? {
        
        var dateComponents = DateComponents()
        
        dateComponents.year = 2;
        let today = Date()
        
        let twoYearsFromNow = (self.calendarView.calendar as NSCalendar).date(byAdding: dateComponents, to: today, options: NSCalendar.Options())
        
        return twoYearsFromNow
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        let width = self.view.frame.size.width - 16.0 * 2
        let height = width + 20.0
        self.calendarView.frame = CGRect(x: 16.0, y: 32.0, width: width, height: height)
        
        
    }
    
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
