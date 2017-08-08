//
//  CalendarDayCell.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/7/17.
//  Copyright © 2017 Make School. All rights reserved.
//
import UIKit

let cellColorDefault = UIColor(white: 0.0, alpha: 0.1)
let cellColorToday = UIColor(red: 254.0/255.0, green: 73.0/255.0, blue: 64.0/255.0, alpha: 0.3)
let borderColor = UIColor(red: 254.0/255.0, green: 73.0/255.0, blue: 64.0/255.0, alpha: 0.8)

class CalendarDayCell: UICollectionViewCell {

    var isToday : Bool = false {
        
        didSet {
            
            if isToday == true {
                self.pBackgroundView.backgroundColor = cellColorToday
            }
            else {
                self.pBackgroundView.backgroundColor = cellColorDefault
            }
        }
    }
    
    override var isSelected : Bool {
        
        didSet {
            
            if isSelected == true {
                self.pBackgroundView.layer.borderWidth = 2.0
                
            }
            else {
                self.pBackgroundView.layer.borderWidth = 0.0
            }
            
        }
    }
    
    var mood: Mood = .indifferent {
        
        didSet {
            pBackgroundView.backgroundColor = mood.color
        }
        
    }
    
    lazy var pBackgroundView : UIView = {
        
        var vFrame = self.frame.insetBy(dx: 3.0, dy: 3.0)
        
        let view = UIView(frame: vFrame)
        
        view.layer.cornerRadius = 4.0
        
        view.layer.borderColor = borderColor.cgColor
        view.layer.borderWidth = 0.0
        
        view.center = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        
        view.backgroundColor = cellColorDefault
        
        
        return view
    }()
    
    lazy var textLabel : UILabel = {
        
        let lbl = UILabel()
        lbl.textAlignment = NSTextAlignment.center
        lbl.textColor = UIColor.darkGray
        
        return lbl
        
    }()
    
    lazy var dotsView : UIView = {
        
        let frm = CGRect(x: 8.0, y: self.frame.size.width - 10.0 - 4.0, width: self.frame.size.width - 16.0, height: 8.0)
        let dv = UIView(frame: frm)
        
        
        return dv
        
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        
        self.addSubview(self.pBackgroundView)
        
        self.textLabel.frame = self.bounds
        self.addSubview(self.textLabel)
        
        self.addSubview(dotsView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
