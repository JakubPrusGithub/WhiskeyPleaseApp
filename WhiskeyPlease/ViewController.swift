//
//  ViewController.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 18/01/2023.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        navigationController?.navigationBar.prefersLargeTitles = true
        title="Articles"
        tableView.separatorColor = UIColor(named: "textColor")
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = tableView.bounds
        let myGrayLighter = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
        let myGrayDarker = UIColor(red: 15.0/255.0, green: 15.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        gradientLayer.colors = [
            myGrayDarker.cgColor,
            myGrayLighter.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Article", for: indexPath) as! ArticleTableViewCell
        
        cell.title.text = "Default title"
        cell.thumbnail.image = UIImage()
        cell.desc.text = "Default, short and simple description provided from application for this specific cell of table for article. Default, short and simple description provided from application for this specific cell of table for article."
        cell.backgroundColor = .clear
        let thumbnail = UIImage(named: "default.jpeg")
        cell.title.textColor = UIColor(named: "titleColor")
        cell.desc.textColor = UIColor(named: "textColor")
        cell.thumbnail.image = thumbnail
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
}

