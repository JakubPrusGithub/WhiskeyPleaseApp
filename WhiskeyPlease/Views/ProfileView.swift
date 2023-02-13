//
//  ProfileView.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 03/02/2023.
//

import UIKit

class ProfileView: UIViewController {

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
}
