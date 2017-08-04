//
//  MoodPaletteView.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/3/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class MoodPaletteView: UIView {
    
    @IBOutlet var collectionView: UICollectionView!
    
    let moods = Mood.returnAllMoods()
    
    let cellIdentifier = "MoodCollectionViewCell"
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupCollectionView()
    }
    
    // MARK: - Private Helper Methods
    private func setupCollectionView() {
    
        let nib = UINib(nibName: "MoodCollectionViewCell",
                        bundle: Bundle.main)
        
        collectionView.register(nib,
                                forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    // Performs the initial setup.
    private func setupView() {
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

extension MoodPaletteView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MoodCollectionViewCell
        
        let mood = moods[indexPath.item]
        
        cell.button.backgroundColor = mood.color
        cell.button.layer.cornerRadius = 34
        cell.label.text = mood.rawValue.uppercased()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moods.count
    }
}
//
//extension MoodPaletteView: UICollectionViewDelegate {
//    
//}
