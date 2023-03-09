//
//  ArticleStructs.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 31/01/2023.
//

import Foundation

struct LoadedJSON: Decodable{
    var articles: [Article]
}

struct Article: Decodable{
    var articleTitle: String
    var articleDescription: String
    var articleIngredients: String
    var articleHistory: String
    var articleIcon: String
}
