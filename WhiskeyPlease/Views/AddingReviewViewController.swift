//
//  AddingReviewViewController.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 08/02/2023.
//

import UIKit

class AddingReviewViewController: UIViewController {
    
    
    @IBOutlet weak var whiskeyName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = view.bounds
//        let myGrayLighter = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
//        let myGrayDarker = UIColor(red: 15.0/255.0, green: 15.0/255.0, blue: 10.0/255.0, alpha: 1.0)
//        gradientLayer.colors = [
//            myGrayDarker.cgColor,
//            myGrayLighter.cgColor
//        ]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        view.layer.insertSublayer(gradientLayer, at: 0)
        view.layer.backgroundColor = UIColor(named: "ingredientsBackgroundColor")?.cgColor
        whiskeyName.overrideUserInterfaceStyle = UIUserInterfaceStyle.light
    }
}
