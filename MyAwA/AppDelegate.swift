//
//  AppDelegate.swift
//  MyAwA
//
//  Created by Athletes with Autism on 7/25/14.
//  Copyright (c) 2014 Athletes with Autism. All rights reserved.
//

import CoreData
import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?
    @objc var forsource: UIView?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    @objc func saveContext () {
        var error: NSError? = nil
        let managedObjectContext = self.managedObjectContext
       // if managedObjectContext != nil {
            if managedObjectContext.hasChanges {
           do {
               try managedObjectContext.save()
           } catch let error1 as NSError {
               error = error1
            print("Error in saveContext \(error)")
               // Replace this implementation with code to handle the error appropriately.
               // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
               //println("Unresolved error \(error), \(error.userInfo)")
               abort()
           }
       }
        //}
    }

    // #pragma mark - Core Data stack

    // Returns the managed object context for the application.
    // If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
    @objc var managedObjectContext: NSManagedObjectContext {
        if !(_managedObjectContext != nil) {
            let coordinator = self.persistentStoreCoordinator
            
            //if coordinator != nil {
                _managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
                _managedObjectContext!.persistentStoreCoordinator = coordinator
            //}
        }
        return _managedObjectContext!
    }
    @objc var _managedObjectContext: NSManagedObjectContext? = nil

    // Returns the managed object model for the application.
    // If the model doesn't already exist, it is created from the application's model.
    @objc var managedObjectModel: NSManagedObjectModel {
        if !(_managedObjectModel != nil) {
            let modelURL = Bundle.main.url(forResource: "MyAwA", withExtension: "momd")
            _managedObjectModel = NSManagedObjectModel(contentsOf: modelURL!)
        }
        return _managedObjectModel!
    }
    @objc var _managedObjectModel: NSManagedObjectModel? = nil

    // Returns the persistent store coordinator for the application.
    // If the coordinator doesn't already exist, it is created and the application's store added to it.
    @objc var persistentStoreCoordinator: NSPersistentStoreCoordinator {
        if !(_persistentStoreCoordinator != nil) {
            let storeURL = self.applicationDocumentsDirectory.appendingPathComponent("MyAwA.sqlite")
            var error: NSError? = nil
            _persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
            do {
                try _persistentStoreCoordinator!.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
            } catch let error1 as NSError {
                error = error1
                print("persistentStoreCoordinator Error \(error)")
                /*
                Replace this implementation with code to handle the error appropriately.

                abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                Typical reasons for an error here include:
                * The persistent store is not accessible;
                * The schema for the persistent store is incompatible with current managed object model.
                Check the error message to determine what the actual problem was.


                If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.

                If you encounter schema incompatibility errors during development, you can reduce their frequency by:
                * Simply deleting the existing store:
                NSFileManager.defaultManager().removeItemAtURL(storeURL, error: nil)

                * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
                [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true}

                Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.

                */
                //println("Unresolved error \(error), \(error.userInfo)")
                abort()
            }
        }
        return _persistentStoreCoordinator!
    }
    @objc var _persistentStoreCoordinator: NSPersistentStoreCoordinator? = nil

    // #pragma mark - Application's Documents directory
                                    
    // Returns the URL to the application's Documents directory.
    @objc var applicationDocumentsDirectory: URL {
    
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            //println("DocDirectory \(urls)")

        return urls[urls.endIndex-1] 
    }

}

