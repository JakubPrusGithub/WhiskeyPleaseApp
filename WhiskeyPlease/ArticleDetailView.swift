//
//  ArticleDetailView.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 24/01/2023.
//

import UIKit

class ArticleDetailView: UIViewController {


    @IBOutlet weak var tescior: UITextView!
    @IBOutlet weak var whiskeyBackgroundView: UIView!
    @IBOutlet weak var tekscik: UILabel!
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
        
//        let appearance = UINavigationBarAppearance()
//        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "detailViewTitleColor")!]
//        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(named: "detailViewTitleColor")!, .font: "Kerl"]
//
//        navigationItem.standardAppearance = appearance
//        navigationItem.scrollEdgeAppearance = appearance
        
        tescior.textContainer.exclusionPaths = [UIBezierPath(rect: CGRect(x: 225, y: 0, width: 200, height: 180))]
        tescior.layer.shadowRadius = 2.0
        tescior.layer.shadowOpacity = 1.0
        tescior.layer.shadowColor = UIColor.black.cgColor
        tescior.layer.shadowOffset = CGSizeMake(-0.5, -0.5)
        
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tekscik.text = "lololo"
        self.view.layer.backgroundColor = UIColor(named: "detailViewBackground")?.cgColor
        title = "Johnnie Walker"
        
        whiskeyBackgroundView.layer.cornerRadius = 20
        whiskeyBackgroundView.layer.shadowColor = UIColor.black.cgColor
        whiskeyBackgroundView.layer.shadowRadius = 10
        whiskeyBackgroundView.layer.shadowOpacity = 1
        whiskeyBackgroundView.layer.shadowOffset = .zero
    }
    
}
