//
//  MyWhiskeysView.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 02/02/2023.
//

import UIKit

class MyWhiskeysView: UICollectionViewController {

    var allUserReviewedWhiskey = AllReviewedWhiskeys()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="My Whiskeys"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWhiskey))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "titleColor")
        
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
        
        //collectionView.layer.insertSublayer(gradientLayer, at: 0)
        let collectionViewBackgroundView = UIView()
        collectionView.backgroundView = collectionViewBackgroundView
        collectionView.backgroundView?.layer.addSublayer(gradientLayer)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reviewedWhiskeyCell", for: indexPath) as! ReviewedWhiskeyCollectionViewCell
        cell.layer.backgroundColor = UIColor(named: "ingredientsBackgroundColor")?.cgColor
        cell.layer.cornerRadius = 20
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowRadius = 10
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = .zero
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allUserReviewedWhiskey.allReviewedWhiskeys.count*5
    }
    
    @objc func addWhiskey(){
        lazy var reviewSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReviewSheet")
        if let sheet = reviewSheet.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        present(reviewSheet, animated: true)
        // if let vc = storyboard?.instantiateViewController(withIdentifier: "ReviewSheet") as? AddingReviewViewController {
    }
    
}
