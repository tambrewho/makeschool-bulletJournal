//
//  MoodPaletteView.swift
//  bulletJournal
//
//  Created by Tambre Hu on 8/3/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class MoodPaletteView: UIView, Nibloading {
    
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
    
        let nib = UINib(nibName: cellIdentifier,
                        bundle: Bundle.main)
        
        collectionView.register(nib,
                                forCellWithReuseIdentifier: cellIdentifier)
        
    }
    
    
}

extension MoodPaletteView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MoodCollectionViewCell
        
        let mood = moods[indexPath.item]
        
        cell.button.backgroundColor = mood.color
        cell.button.layer.cornerRadius = 33.5
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
