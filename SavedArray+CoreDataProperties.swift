//
//  SavedArray+CoreDataProperties.swift
//  MyAwA
//
//  Created by Athletes with Autism on 9/17/16.
//  Copyright © 2016 Athletes with Autism. All rights reserved.
//

import Foundation
import CoreData


extension SavedArray {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedArray> {
        return NSFetchRequest<SavedArray>(entityName: "SavedArray");
    }

    @NSManaged public var array: NSObject?
    @NSManaged public var name: String?
    @NSManaged public var support: NSObject?
    @NSManaged public var times: NSObject?

}
