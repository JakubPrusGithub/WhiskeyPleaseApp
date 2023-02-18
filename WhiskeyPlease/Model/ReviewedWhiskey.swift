//
//  ReviewedWhiskey.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 05/02/2023.
//

import Foundation

class AllReviewedWhiskeys {
    
    static let shared = AllReviewedWhiskeys()
    
    var allReviewedWhiskeys: [ReviewedWhiskey]
    
    private init() {
        
        // soon there will be code to load user data from CoreData
        
        self.allReviewedWhiskeys = [ReviewedWhiskey]()
        self.allReviewedWhiskeys.append(ReviewedWhiskey(whiskeyName: "Jack Daniel's", taste: 8, nose: 9, finish: 4, presence: 7, impression: 9))
        self.allReviewedWhiskeys.append(ReviewedWhiskey(whiskeyName: "The Famous Grouse", taste: 4, nose: 3, finish: 7, presence: 7, impression: 6))
        self.allReviewedWhiskeys.append(ReviewedWhiskey(whiskeyName: "Johnnie Walker Black Label", taste: 10, nose: 7, finish: 8, presence: 9, impression: 9))
        self.allReviewedWhiskeys.append(ReviewedWhiskey(whiskeyName: "Ballantine's", taste: 7, nose: 7, finish: 5, presence: 6, impression: 7))
    }
    
    func addReview(_ review: ReviewedWhiskey){
        self.allReviewedWhiskeys.insert(review, at: 0)
    }
    
    func replaceReview(old: ReviewedWhiskey, new: ReviewedWhiskey){
        for index in 0..<self.allReviewedWhiskeys.count {
            if self.allReviewedWhiskeys[index].id == old.id {
                self.allReviewedWhiskeys[index] = new
            }
        }
    }
    
    func deleteReview(review: ReviewedWhiskey){
        self.allReviewedWhiskeys.removeAll { rev in
            return rev.id == review.id
        }
    }
    
    func deleteAllReviews(){
        self.allReviewedWhiskeys = []
    }
}



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
