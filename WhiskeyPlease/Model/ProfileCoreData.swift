//
//  ProfileCoreData.swift
//  WhiskeyPlease
//
//  Created by Jakub Prus on 09/03/2023.
//

import CoreData

@objc(Profile)
class Profile: NSManagedObject{
    @NSManaged var nickname: String!
    @NSManaged var createdDate: String!
}
