//
//  Photos+CoreDataProperties.swift
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

extension Photos {

    @NSManaged var filePath: String?
    @NSManaged var id: String?
    @NSManaged var title: String?
    @NSManaged var url: String?
    @NSManaged var pin: Pin?

}
