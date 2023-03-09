//
//  LoadArticles.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 31/01/2023.
//

import UIKit

class LoadArticles: NSObject {
    
    var allArticles: [Article]
    
    override init() {
        self.allArticles = [Article]()
        super.init()
        loadJson(filename: "articles")
    }
    
    func loadJson(filename fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(LoadedJSON.self, from: data)
                self.allArticles = jsonData.articles
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

