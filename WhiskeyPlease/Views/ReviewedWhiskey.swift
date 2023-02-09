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
    
    // 1-5 rating
    var taste = 1
    var nose = 1
    var finish = 1
    var presence = 1
    var impression = 1
    
    // all evaluation criteria summed up and devided by 5
    var overall: Double = 1.0

    static let example = ReviewedWhiskey(whiskeyName: "Example Whiskey", taste: 1, nose: 2, finish: 3, presence: 4, impression: 5, overall: 3.0)
}
