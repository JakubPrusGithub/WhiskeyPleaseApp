//
//  ProfileView.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 03/02/2023.
//

import UIKit

class ProfileView: UIViewController {
    
    var reviews = AllReviewedWhiskeys.shared

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        let myGrayLighter = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        let myGrayDarker = UIColor(red: 15.0/255.0, green: 15.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        gradientLayer.colors = [
            myGrayDarker.cgColor,
            myGrayLighter.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        title="Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @IBAction func clickedAbout(_ sender: Any) {
        let reviewSheet = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutSheet")
        if let sheet = reviewSheet.sheetPresentationController {
            sheet.detents = [.custom { content in
                return content.maximumDetentValue * 0.4
            }]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 20
        }
        present(reviewSheet, animated: true)
    }
    
    @IBAction func clickedDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete reviews?", message: "Are you sure you want to permanently delete all your reviews?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {[weak self] conetext in
            self?.reviews.allReviewedWhiskeys = []
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
