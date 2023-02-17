//
//  AddingReviewViewController.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 08/02/2023.
//

import UIKit

protocol UpdateViewWithNewReview{
    func updateViewWithNewReview(newReview: ReviewedWhiskey)
    func updateViewWithEditedReview(newReview: ReviewedWhiskey, oldReview: ReviewedWhiskey)
}

class AddingReviewViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var whiskeyName: UITextField!
    @IBOutlet weak var tasteRating: RatingController!
    @IBOutlet weak var noseRating: RatingController!
    @IBOutlet weak var finishRating: RatingController!
    @IBOutlet weak var presenceRating: RatingController!
    @IBOutlet weak var impressionRating: RatingController!
    
//    var name = ""
//    var tasteStars = 0
//    var noseStars = 0
//    var finishStars = 0
//    var presenceStars = 0
//    var impressionStars = 0
    
    var editedReview = ReviewedWhiskey(whiskeyName: "", taste: 0, nose: 0, finish: 0, presence: 0, impression: 0)
    var isEditingReview = false
    
    var delegate: UpdateViewWithNewReview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(named: "ingredientsBackgroundColor")?.cgColor
        whiskeyName.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        whiskeyName.delegate = self
        
        whiskeyName.text = editedReview.whiskeyName
        tasteRating.starsRating = editedReview.taste
        noseRating.starsRating = editedReview.nose
        finishRating.starsRating = editedReview.finish
        presenceRating.starsRating = editedReview.presence
        impressionRating.starsRating = editedReview.impression
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        guard let reviewedWhiskeyName = whiskeyName.text else {return}
        let taste = tasteRating.starsRating
        let nose = noseRating.starsRating
        let finish = finishRating.starsRating
        let presence = presenceRating.starsRating
        let impression = impressionRating.starsRating
        let newReview = ReviewedWhiskey(whiskeyName: reviewedWhiskeyName, taste: taste, nose: nose, finish: finish, presence: presence, impression: impression)
        if isEditingReview == false {
            delegate?.updateViewWithNewReview(newReview: newReview)
        }
        else{
            delegate?.updateViewWithEditedReview(newReview: newReview, oldReview: editedReview)
        }
        dismiss(animated: true)
    }
}
