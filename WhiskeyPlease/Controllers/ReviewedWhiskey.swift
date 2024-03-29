//
//  ReviewedWhiskey.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 05/02/2023.
//

import Foundation
import CoreData
import UIKit

class AllReviewedWhiskeys {
    
    static let shared = AllReviewedWhiskeys()
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "WhiskeyPlease")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {

                fatalError("Unresolved error, \((error as NSError).userInfo)")
            }
        })
        return container
    }()
    
    var allReviewedWhiskeys: [ReviewedWhiskey]
    var profileNickname: String
    var createdDate: String
    
    private init() {
        self.allReviewedWhiskeys = [ReviewedWhiskey]()
        self.profileNickname = "Nickname"
        let dateFormatter = DateFormatter()
        let today = String(Date.now.formatted(date: .long, time: .omitted))
        dateFormatter.dateFormat = "dd.MM.yy"
        self.createdDate = today
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = persistentContainer.viewContext
        let requestWhiskey = NSFetchRequest<NSFetchRequestResult>(entityName: "Whiskey")
        do{
            let results: NSArray = try context.fetch(requestWhiskey) as NSArray
            for result in results {
                let whiskey = result as! Whiskey
                allReviewedWhiskeys.insert(ReviewedWhiskey(id: whiskey.id, whiskeyName: whiskey.whiskeyName, taste: Int(truncating: whiskey.taste), nose: Int(truncating: whiskey.nose), finish: Int(truncating: whiskey.finish), presence: Int(truncating: whiskey.presence), impression: Int(truncating: whiskey.impression)), at: 0)
            }
        }
        catch{
            print("Failed to load whiskeys: \(error.localizedDescription)")
        }
        
        let requestProfile = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do{
            let results: NSArray = try context.fetch(requestProfile) as NSArray
            for result in results {
                let data = result as! Profile
                self.profileNickname = data.nickname
                self.createdDate = data.createdDate
                data.createdDate = self.createdDate
                try context.save()
            }
        }
        catch{
            print("Failed to load profile info: \(error.localizedDescription)")
        }
    }
    
    func addReview(_ review: ReviewedWhiskey){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Whiskey", in: context)
        let newReview = Whiskey(entity: entity!, insertInto: context)
        newReview.whiskeyName = review.whiskeyName
        newReview.id = review.id
        newReview.taste = review.taste as NSNumber
        newReview.nose = review.nose as NSNumber
        newReview.impression = review.impression as NSNumber
        newReview.presence = review.presence as NSNumber
        newReview.finish = review.finish as NSNumber
        newReview.overall = review.overall as NSNumber
        do{
            try context.save()
            self.allReviewedWhiskeys.insert(review, at: 0)
        }
        catch{
            print("Failed to save \(error.localizedDescription)")
        }
    }
    
    func replaceReview(old: ReviewedWhiskey, new: ReviewedWhiskey){
        for index in 0..<self.allReviewedWhiskeys.count {
            if self.allReviewedWhiskeys[index].id == old.id {
                self.allReviewedWhiskeys[index] = new
            }
        }
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Whiskey")
        do{
            let results: NSArray = try context.fetch(request) as NSArray
            for result in results {
                let whiskey = result as! Whiskey
                if whiskey.id == old.id {
                    whiskey.id = new.id
                    whiskey.whiskeyName = new.whiskeyName
                    whiskey.taste = new.taste as NSNumber
                    whiskey.nose = new.nose as NSNumber
                    whiskey.presence = new.presence as NSNumber
                    whiskey.finish = new.finish as NSNumber
                    whiskey.impression = new.impression as NSNumber
                    whiskey.overall = new.overall as NSNumber
                    try context.save()
                }
            }
        }
        catch{
            print("Failed to load \(error.localizedDescription)")
        }
        
    }
    
    func deleteReview(review: ReviewedWhiskey){
        self.allReviewedWhiskeys.removeAll { rev in
            return rev.id == review.id
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Whiskey")
        do{
            let results: NSArray = try context.fetch(request) as NSArray
            for result in results {
                let whiskey = result as! Whiskey
                if whiskey.id == review.id {
                    context.delete(whiskey)
                    try context.save()
                }
            }
        }
        catch{
            print("Failed to load \(error.localizedDescription)")
        }
        
    }
    
    func deleteAllReviews(){
        self.allReviewedWhiskeys = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Whiskey")
        do{
            let results: NSArray = try context.fetch(request) as NSArray
            for result in results {
                let whiskey = result as! Whiskey
                context.delete(whiskey)
                try context.save()
            }
        }
        catch{
            print("Failed to load \(error.localizedDescription)")
        }
    }
    
    func changeNickname(nickname: String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do{
            let results: NSArray = try context.fetch(request) as NSArray
            if results.isEqual(to: []){
                let entity = NSEntityDescription.entity(forEntityName: "Profile", in: context)
                let newNickname = Profile(entity: entity!, insertInto: context)
                newNickname.nickname = nickname
                newNickname.createdDate = self.createdDate
                do{
                    try context.save()
                    self.profileNickname = nickname
                }
                catch{
                    print("Failed to save \(error.localizedDescription)")
                }
            }
            else{
                for result in results {
                    let data = result as! Profile
                    data.nickname = nickname
                    self.profileNickname = nickname
                    try context.save()
                }
            }
        }
        catch{
            print("Failed to load \(error.localizedDescription)")
        }
    }
}
