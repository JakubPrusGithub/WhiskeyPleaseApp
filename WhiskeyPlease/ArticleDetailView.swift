//
//  ArticleDetailView.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 24/01/2023.
//

import UIKit

class ArticleDetailView: UIViewController {


    @IBOutlet weak var barlet: UIImageView!
    
    @IBOutlet weak var whiskeyIcon: UIImageView!
    @IBOutlet weak var ingredients: UIView!
    @IBOutlet weak var shortDesc: UITextView!
    @IBOutlet weak var whiskeyBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sbarlet.tintColor = .brown
        
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
        
//        let appearance = UINavigationBarAppearance()
//        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "detailViewTitleColor")!]
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "detailViewTitleColor")!, .font: "Kerl"]
//
//        navigationItem.standardAppearance = appearance
//        navigationItem.scrollEdgeAppearance = appearance
        
        shortDesc.textContainer.exclusionPaths = [UIBezierPath(rect: CGRect(x: 225, y: 0, width: 200, height: 135))]
        shortDesc.layer.shadowRadius = 2.0
        shortDesc.layer.shadowOpacity = 1.0
        shortDesc.layer.shadowColor = UIColor.black.cgColor
        shortDesc.layer.shadowOffset = CGSizeMake(-0.5, -0.5)
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.view.layer.backgroundColor = UIColor(named: "detailViewBackground")?.cgColor
        title = "Johnnie Walker"
        
        ingredients.layer.cornerRadius = 20
        ingredients.layer.shadowColor = UIColor.black.cgColor
        ingredients.layer.shadowRadius = 10
        ingredients.layer.shadowOpacity = 1
        ingredients.layer.shadowOffset = .zero
        
        whiskeyBackgroundView.layer.cornerRadius = 20
        whiskeyBackgroundView.layer.shadowColor = UIColor.black.cgColor
        whiskeyBackgroundView.layer.shadowRadius = 10
        whiskeyBackgroundView.layer.shadowOpacity = 1
        whiskeyBackgroundView.layer.shadowOffset = .zero
    }
    
}
