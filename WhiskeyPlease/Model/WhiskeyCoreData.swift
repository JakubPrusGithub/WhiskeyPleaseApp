//
//  WhiskeyCoreData.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 03/03/2023.
//

import CoreData

@objc(Whiskey)
class Whiskey: NSManagedObject{
    @NSManaged var id: UUID!
    @NSManaged var whiskeyName: String!
    @NSManaged var taste: NSNumber!
    @NSManaged var nose: NSNumber!
    @NSManaged var finish: NSNumber!
    @NSManaged var presence: NSNumber!
    @NSManaged var impression: NSNumber!
    @NSManaged var overall: NSNumber!
}
