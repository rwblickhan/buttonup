//
//  Subscriber.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/20/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

@objc class Subscriber: NSObject {
    @NSManaged var creationDate: Date?
    @NSManaged var email: String?
    @NSManaged var id: String?
    @NSManaged var notes: String?
    @NSManaged var referrerURL: URL?
    @NSManaged var source: String?
    @NSManaged var subscriberType: SubscriberType
    @NSManaged var utmCampaign: String?
    @NSManaged var utmMedium: String?
    @NSManaged var utmSource: String?
    
    @NSManaged var tags: NSOrderedSet // Tag
}
