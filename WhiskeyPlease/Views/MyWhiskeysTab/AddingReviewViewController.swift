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
    func updateViewWithDeletedReview(deleteReview: ReviewedWhiskey)
}

class AddingReviewViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var whiskeyName: UITextField!
    @IBOutlet weak var tasteRating: RatingController!
    @IBOutlet weak var noseRating: RatingController!
    @IBOutlet weak var finishRating: RatingController!
    @IBOutlet weak var presenceRating: RatingController!
    @IBOutlet weak var impressionRating: RatingController!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    var editedReview = ReviewedWhiskey(whiskeyName: "", taste: 0, nose: 0, finish: 0, presence: 0, impression: 0)
    var isEditingReview = false
    
    var delegate: UpdateViewWithNewReview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor(named: "ingredientsBackgroundColor")?.cgColor
        whiskeyName.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
        titleText.text = "Add new review"
        deleteButton.isEnabled = false
        if editedReview.whiskeyName != "" {
            titleText.text = "Edit your review"
            deleteButton.isEnabled = true
        }
        
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
    func reviewValidation() -> Bool{
        guard whiskeyName.text != "" else {shake(thisView: whiskeyName); return false}
        guard tasteRating.starsRating > 0 else {shake(thisView: tasteRating); return false}
        guard noseRating.starsRating > 0 else {shake(thisView: noseRating); return false}
        guard finishRating.starsRating > 0 else {shake(thisView: finishRating); return false}
        guard presenceRating.starsRating > 0 else {shake(thisView: presenceRating); return false}
        guard impressionRating.starsRating > 0 else {shake(thisView: impressionRating); return false}
        return true
    }
    
    func shake(thisView: UIView){
        let shakeAnim = CABasicAnimation(keyPath: "position")
        shakeAnim.duration = 0.05
        shakeAnim.repeatCount = 5
        shakeAnim.autoreverses = true
        shakeAnim.fromValue = CGPoint(x: thisView.center.x - 5.0, y: thisView.center.y)
        shakeAnim.toValue = CGPoint(x: thisView.center.x + 5.0, y: thisView.center.y)
        thisView.layer.add(shakeAnim, forKey: "position")
    }
    
    @IBAction func doneButton(_ sender: Any) {
        guard let reviewedWhiskeyName = whiskeyName.text else {return}
        guard reviewValidation() else {return}
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
    
    @IBAction func clickedDelete(_ sender: Any) {
        delegate?.updateViewWithDeletedReview(deleteReview: editedReview)
        dismiss(animated: true)
    }
    
}
