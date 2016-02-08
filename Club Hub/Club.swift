//
//  Club.swift
//  Club Hub
//
//  Created by AJ Yoo on 12/27/15.
//  Copyright © 2015 BlueHammer. All rights reserved.
//

import UIKit
import CoreData

class Club: NSManagedObject {
    
    // MARK: Properties
    @NSManaged var name: String
    @NSManaged var logo: UIImage
    @NSManaged var backgroundImage: UIImage?
    
    // MARK: Initialization
    convenience init?(name: String, logo: UIImage, backgroundImage: UIImage?) {
        if name.isEmpty {
            return nil
        }
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        let entity = NSEntityDescription.entityForName("Club", inManagedObjectContext: context)
        self.init(entity: entity!, insertIntoManagedObjectContext: context)
        self.name = name
        self.logo = logo
        self.backgroundImage = backgroundImage
    }
    
}
