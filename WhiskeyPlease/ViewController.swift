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
        navigationController?.navigationBar.prefersLargeTitles = true
        title="Articles"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Article", for: indexPath) as! ArticleTableViewCell
        cell.title.text = "Default title"
        cell.thumbnail.image = UIImage()
        cell.desc.text = "Default description"
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

