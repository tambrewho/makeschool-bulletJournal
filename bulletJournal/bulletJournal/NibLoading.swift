//
//  NibLoading.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/4/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

protocol Nibloading {}

extension Nibloading where Self: UIView {
    
    // Performs the initial setup.
    func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        
        // Auto-layout stuff.
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        // Show the view.
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
}
