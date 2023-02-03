//
//  MyWhiskeysView.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 02/02/2023.
//

import UIKit

class MyWhiskeysView: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title="My Whiskeys"
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
    
}
