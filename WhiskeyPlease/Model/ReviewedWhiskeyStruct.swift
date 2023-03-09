//
//  ReviewedWhiskeyStruct.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 09/03/2023.
//

import Foundation

struct ReviewedWhiskey: Codable {
    
    var id = UUID()
    var whiskeyName: String
    
    // 1-10 rating
    var taste: Int
    var nose: Int
    var finish: Int
    var presence: Int
    var impression: Int
    
    // all evaluation criteria summed up and doubled
    var overall: Int {
        return (taste+nose+finish+presence+impression)*2
    }

    static let example = ReviewedWhiskey(whiskeyName: "Example Whiskey", taste: 2, nose: 4, finish: 6, presence: 8, impression: 10)
}
