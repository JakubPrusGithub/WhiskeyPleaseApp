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
    @IBOutlet weak var thumbnailButton: UIButton!
    
    // Secondary view of cell (flipped)
    @IBOutlet weak var details: UIView!
    @IBOutlet weak var tasteText: UILabel!
    @IBOutlet weak var noseText: UILabel!
    @IBOutlet weak var finishText: UILabel!
    @IBOutlet weak var presenceText: UILabel!
    @IBOutlet weak var impressionText: UILabel!
    @IBOutlet weak var detailsButton: UIButton!
    
    private var animationDuration: Double = 0.75
    var wiggling = false
    
    
    @IBAction func clickedFlipping(_ sender: Any) {
        UIView.transition(from: thumbnail, to: details, duration: animationDuration, options: [.transitionFlipFromLeft, .showHideTransitionViews])
        guard wiggling != true else {return}
        
    }
    
    @IBAction func clickedReflipping(_ sender: Any) {
        UIView.transition(from: details, to: thumbnail, duration: animationDuration, options: [.transitionFlipFromRight, .showHideTransitionViews])
    }
    
    func wiggle(duration: Double) {
        wiggling = true
        thumbnailButton.isHidden = true
        detailsButton.isHidden = true
        let transformAnim  = CAKeyframeAnimation(keyPath:"transform")
        transformAnim.values  = [NSValue(caTransform3D: CATransform3DMakeRotation(0.04, 0.0, 0.0, 1.0)),NSValue(caTransform3D: CATransform3DMakeRotation(-0.04 , 0, 0, 1))]
        transformAnim.autoreverses = true
        transformAnim.duration  = duration
        transformAnim.repeatCount = .infinity
        self.layer.add(transformAnim, forKey: "transform")
    }
    
    func stopWiggle() {
        wiggling = false
        thumbnailButton.isHidden = false
        detailsButton.isHidden = false
        self.layer.removeAllAnimations()
    }
}
