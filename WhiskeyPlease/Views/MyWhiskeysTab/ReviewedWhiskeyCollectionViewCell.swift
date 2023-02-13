//
//  ReviewedWhiskeyCollectionViewCell.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 06/02/2023.
//

import UIKit

class ReviewedWhiskeyCollectionViewCell: UICollectionViewCell {
    
    // Default view of cell
    @IBOutlet weak var thumbnail: UIView!
    @IBOutlet weak var whiskeyNameCell: UILabel!
    @IBOutlet weak var whiskeyOverallRating: UILabel!
    
    // Secondary view of cell (flipped)
    @IBOutlet weak var details: UIView!
    @IBOutlet weak var tasteText: UILabel!
    @IBOutlet weak var noseText: UILabel!
    @IBOutlet weak var finishText: UILabel!
    @IBOutlet weak var presenceText: UILabel!
    @IBOutlet weak var impressionText: UILabel!
    
    private var animationDuration: Double = 0.75
    
    @IBAction func clickedFlipping(_ sender: Any) {
        UIView.transition(from: thumbnail, to: details, duration: animationDuration, options: [.transitionFlipFromLeft, .showHideTransitionViews])
    }
    
    @IBAction func clickedReflipping(_ sender: Any) {
        UIView.transition(from: details, to: thumbnail, duration: animationDuration, options: [.transitionFlipFromRight, .showHideTransitionViews])
    }
}
