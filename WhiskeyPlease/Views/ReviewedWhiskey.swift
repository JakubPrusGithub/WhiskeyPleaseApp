//
//  ReviewedWhiskey.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 05/02/2023.
//

import Foundation

class AllReviewedWhiskeys {
    var allReviewedWhiskeys: [ReviewedWhiskey]
    
    init() {
        
        // soon there will be code to load user data from CoreData
        
        self.allReviewedWhiskeys = [ReviewedWhiskey]()
        self.allReviewedWhiskeys.append(ReviewedWhiskey.example)
        self.allReviewedWhiskeys.append(ReviewedWhiskey.example)
        self.allReviewedWhiskeys.append(ReviewedWhiskey.example)
    }
}



struct ReviewedWhiskey: Codable {
    
    var whiskeyName = ""
    
    // 1-10 rating
    var taste: Int
    var nose: Int
    var finish: Int
    var presence: Int
    var impression: Int
    
    // all evaluation criteria summed up and doubled
    var overall: Int

    static let example = ReviewedWhiskey(whiskeyName: "Example Whiskey", taste: 2, nose: 4, finish: 6, presence: 8, impression: 10, overall: 60)
}
