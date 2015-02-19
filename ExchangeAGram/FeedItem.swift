//
//  FeedItem.swift
//  ExchangeAGram
//
//  Created by Andy Stannard on 19/02/2015.
//  Copyright (c) 2015 inni Accounts. All rights reserved.
//

import Foundation
import CoreData

@objc (FeedItem)
class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData
    @NSManaged var thumbnail: NSData
    @NSManaged var lattitude: NSNumber
    @NSManaged var longitude: NSNumber

}
