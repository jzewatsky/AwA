//
//  StoryArray+CoreDataProperties.swift
//  MyAwA
//
//  Created by Athletes with Autism on 9/17/16.
//  Copyright © 2016 Athletes with Autism. All rights reserved.
//

import Foundation
import CoreData


extension StoryArray {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StoryArray> {
        return NSFetchRequest<StoryArray>(entityName: "StoryArray");
    }

    @NSManaged public var storyImages: NSObject?
    @NSManaged public var storyName: String?
    @NSManaged public var storyText: NSObject?

}
