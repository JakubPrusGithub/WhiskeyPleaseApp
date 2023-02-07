//
//  RatingController.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 07/02/2023.
//

import UIKit

class RatingController: UIStackView {
    var starsRating = 0
    
    // using SF Symbols
    var starsEmptyName = "star"
    var starsFilledName = "star.fill"
   
    override func draw(_ rect: CGRect) {
        let myViews = self.subviews.filter{$0 is UIButton}
        var starTag = 1
        for theView in myViews {
            if let theButton = theView as? UIButton{
                theButton.setImage(UIImage(systemName: starsEmptyName), for: .normal)
                theButton.addTarget(self, action: #selector(self.pressed(sender:)), for: .touchUpInside)
                theButton.tag = starTag
                starTag = starTag + 1
            }
        }
    }
    @objc func pressed(sender: UIButton) {
        starsRating = sender.tag
        let myViews = self.subviews.filter{$0 is UIButton}
        for theView in myViews {
            if let theButton = theView as? UIButton {
                if theButton.tag > sender.tag {
                    theButton.setImage(UIImage(systemName: starsEmptyName), for: .normal)
                }else{
                    theButton.setImage(UIImage(systemName: starsFilledName), for: .normal)
                }
            }
        }
    }
}
