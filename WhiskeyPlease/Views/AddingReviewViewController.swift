//
//  AddingReviewViewController.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 08/02/2023.
//

import UIKit

protocol UpdateViewWithNewReview{
    func updateViewWithNewReview(newReview: ReviewedWhiskey)
}

class AddingReviewViewController: UIViewController {
    
    @IBOutlet weak var whiskeyName: UITextField!
    @IBOutlet weak var tasteRating: RatingController!
    @IBOutlet weak var noseRating: RatingController!
    @IBOutlet weak var finishRating: RatingController!
    @IBOutlet weak var presenceRating: RatingController!
    @IBOutlet weak var impressionRating: RatingController!
    
    var delegate: UpdateViewWithNewReview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(named: "ingredientsBackgroundColor")?.cgColor
        whiskeyName.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        guard let reviewedWhiskeyName = whiskeyName.text else {return}
        let taste = tasteRating.starsRating
        let nose = noseRating.starsRating
        let finish = finishRating.starsRating
        let presence = presenceRating.starsRating
        let impression = impressionRating.starsRating
        let newReview = ReviewedWhiskey(whiskeyName: reviewedWhiskeyName, taste: taste, nose: nose, finish: finish, presence: presence, impression: impression)
        delegate?.updateViewWithNewReview(newReview: newReview)
        dismiss(animated: true)
    }
}
