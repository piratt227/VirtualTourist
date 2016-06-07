//
//  CoreDataStack.swift
//  VirtualTourist
//
//  Created by Aaron Phillips on 6/7/16.
//  Copyright © 2016 Aaron Phillips. All rights reserved.
//

import Foundation
import CoreData

private let SQLITE_FILE_NAME = "VirtualTourist.sqlite"

class CoreDataStack {
    
    //****************************
    // Shared Instance
    //****************************
    
    class func sharedInstance() -> CoreDataStack {
        struct Static {
            static let instance = CoreDataStack()
        }
        return Static.instance
    }
    
    //****************************
    // Core Data Stack
    //****************************
    
    lazy var applicationDocumentsDirectory: NSURL = {
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    } ()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = NSBundle.mainBundle().URLForResource("VirtualTourist", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
    } ()
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
        let coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent(SQLITE_FILE_NAME)
        var failureReason = "Error creating or loading saved data"
        do {
            try coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
        } catch {
            var dictionary = [String: AnyObject]()
            dictionary[NSLocalizedDescriptionKey] = "Failed to initialize saved data"
            dictionary[NSLocalizedFailureReasonErrorKey] = failureReason
            dictionary[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dictionary)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        return coordinator
    } ()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    //****************************
    // Core Data Saving
    //****************************
    
    func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}