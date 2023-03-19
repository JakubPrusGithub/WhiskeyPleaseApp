//
//  ViewController.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 18/01/2023.
//

import UIKit

class ViewController: UITableViewController{
    
    let articles = LoadArticlesFromJSON()

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
        
        cell.title.text = articles.allArticles[indexPath.row].articleTitle
        cell.desc.text = articles.allArticles[indexPath.row].articleDescription
        cell.backgroundColor = .clear
        cell.title.textColor = UIColor(named: "detailViewTitleColor")
        cell.desc.textColor = UIColor(named: "textColor")
        let thumbnail = UIImage(named: "\(articles.allArticles[indexPath.row].articleIcon)")
        cell.thumbnail.image = thumbnail
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.allArticles.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? ArticleDetailView {
            vc.detailedArticle = articles.allArticles[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

