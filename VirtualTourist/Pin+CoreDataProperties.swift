//
//  Pin+CoreDataProperties.swift
//  VirtualTourist
//
//  Created by Aaron Phillips on 6/7/16.
//  Copyright © 2016 Aaron Phillips. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Pin {

    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var pageNumber: NSNumber?
    @NSManaged var pinTitle: String?
    @NSManaged var photos: NSManagedObject?

}
