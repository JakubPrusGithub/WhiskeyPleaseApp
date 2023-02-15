//
//  MyWhiskeysView.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 02/02/2023.
//

import UIKit

class MyWhiskeysView: UICollectionViewController, UpdateViewWithNewReview {

    var reviews = AllReviewedWhiskeys.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="My Whiskeys"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWhiskey))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "titleColor")
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
        print(String(describing: reviews.allReviewedWhiskeys))
        collectionView.reloadData()
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
    
    @objc func addWhiskey(){
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
    
    func updateViewWithNewReview(newReview: ReviewedWhiskey) {
        reviews.allReviewedWhiskeys.append(newReview)
        collectionView.reloadData()
    }
}
