//
//  FeedItem.swift
//  ExchangeAGram
//
//  Created by Andy on 01/02/2015.
//  Copyright (c) 2015 inni Accounts. All rights reserved.
//

import Foundation
import CoreData

@objc (FeedItem)
class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData
    @NSManaged var thumbnail: NSData

}
