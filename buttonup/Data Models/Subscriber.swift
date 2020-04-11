//
//  Subscriber.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/20/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

struct Subscriber: Codable {
    let creationDate: Date?
    let email: String
    let id: String?
    let notes: String
    let referrerURL: URL?
    let source: String
    let subscriberType: SubscriberType?
    let utmCampaign: String?
    let utmMedium: String?
    let utmSource: String?

    let tags: [Tag]
}
