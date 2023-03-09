//
//  MyWhiskeysView.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 02/02/2023.
//

import UIKit

class MyWhiskeysView: UICollectionViewController, UpdateViewWithNewReview {
    
    var reviews = AllReviewedWhiskeys.shared
    var editMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="My Whiskeys"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWhiskeyButton))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "titleColor")
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(toggleEdit))
        navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "titleColor")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = collectionView.frame
        let myGrayLighter = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        let myGrayDarker = UIColor(red: 15.0/255.0, green: 15.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        gradientLayer.colors = [
            myGrayDarker.cgColor,
            myGrayLighter.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        let collectionViewBackgroundView = UIView()
        collectionView.backgroundView = collectionViewBackgroundView
        collectionView.backgroundView?.layer.addSublayer(gradientLayer)
        collectionView.reloadData()
        
        editMode = false
        isWiggling()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let id = indexPath.row
        let current = reviews.allReviewedWhiskeys[id]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewedWhiskeyCell", for: indexPath) as! ReviewedWhiskeyCollectionViewCell
        cell.layer.cornerRadius = 20
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = .zero
        cell.whiskeyNameCell.text = current.whiskeyName
        cell.whiskeyOverallRating.text = String(current.overall)
        cell.tasteText.text = "Taste: \(current.taste)"
        cell.noseText.text = "Nose: \(current.nose)"
        cell.finishText.text = "Finish: \(current.finish)"
        cell.presenceText.text = "Presence: \(current.presence)"
        cell.impressionText.text = "Impression: \(current.impression)"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.allReviewedWhiskeys.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let id = indexPath.row
        let currReview = reviews.allReviewedWhiskeys[id]
        editWhiskey(review: currReview)
    }
    func editWhiskey(review: ReviewedWhiskey = ReviewedWhiskey(whiskeyName: "", taste: 0, nose: 0, finish: 0, presence: 0, impression: 0)){
        let reviewSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReviewSheet") as! AddingReviewViewController
        if let sheet = reviewSheet.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        reviewSheet.delegate = self
        reviewSheet.editedReview = review
        reviewSheet.isEditingReview = true
        
        present(reviewSheet, animated: true)
    }
    
    @objc func addWhiskeyButton(){
        let reviewSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReviewSheet") as! AddingReviewViewController
        if let sheet = reviewSheet.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        reviewSheet.delegate = self
        present(reviewSheet, animated: true)
    }
    
    @objc func toggleEdit(){
        editMode.toggle()
        isWiggling()
    }
    
    func isWiggling(){
        if editMode {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(toggleEdit))
            navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "titleColor")
            navigationItem.rightBarButtonItem?.isEnabled = false
            
            guard reviews.allReviewedWhiskeys.count > 0 else {return}
            let count = reviews.allReviewedWhiskeys.count-1
            for cellID in 0...count {
                let currCell = collectionView.cellForItem(at: IndexPath(item: cellID, section: 0)) as? ReviewedWhiskeyCollectionViewCell
                currCell?.wiggle(duration: Double.random(in: 0.1 ... 0.2))
            }
        }
        else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(toggleEdit))
            navigationItem.leftBarButtonItem?.tintColor = UIColor(named: "titleColor")
            navigationItem.rightBarButtonItem?.isEnabled = true
            
            guard reviews.allReviewedWhiskeys.count > 0 else {return}
            let count = reviews.allReviewedWhiskeys.count-1
            for cellID in 0...count {
                let currCell = collectionView.cellForItem(at: IndexPath(item: cellID, section: 0)) as? ReviewedWhiskeyCollectionViewCell
                currCell?.stopWiggle()
            }
        }
    }
    
    func disableEditing(){
        editMode = false
        isWiggling()
        collectionView.reloadData()
    }
    
    func updateViewWithNewReview(newReview: ReviewedWhiskey) {
        reviews.addReview(newReview)
        disableEditing()
    }
    
    func updateViewWithEditedReview(newReview: ReviewedWhiskey, oldReview: ReviewedWhiskey) {
        reviews.replaceReview(old: oldReview, new: newReview)
        disableEditing()
    }
    
    func updateViewWithDeletedReview(deleteReview: ReviewedWhiskey){
        reviews.deleteReview(review: deleteReview)
        disableEditing()
    }
}
