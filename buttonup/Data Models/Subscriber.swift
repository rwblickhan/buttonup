//
//  Subscriber.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/20/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

enum SubscriberType: String, Codable {
    case regular
    case unactivated
    case unpaid
    case spammy
    case removed
}

struct Subscriber: Codable, Hashable {
    let creationDate: Date
    let email: String
    let id: String
    let notes: String
    let referrerURL: URL?
    let source: String
    let subscriberType: SubscriberType
    let utmCampaign: String?
    let utmMedium: String?
    let utmSource: String?

    let tags: [Tag]
    
    enum CodingKeys: String, CodingKey {
        case creationDate = "creation_date"
        case email
        case id
        case notes
        case referrerURL = "referrer_url"
        case source
        case subscriberType = "subscriber_type"
        case utmCampaign = "utm_campaign"
        case utmMedium = "utmMedium"
        case utmSource = "utm_source"
        case tags
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        creationDate = try values.decode(Date.self, forKey: .creationDate)
        email = try values.decode(String.self, forKey: .email)
        id = try values.decode(String.self, forKey: .id)
        notes = try values.decode(String.self, forKey: .notes)
        let urlString = try values.decode(String.self, forKey: .referrerURL)
        if !urlString.isEmpty {
            referrerURL = URL(string: urlString)
        } else {
            referrerURL = nil
        }
        source = try values.decode(String.self, forKey: .source)
        subscriberType = try values.decode(SubscriberType.self, forKey: .subscriberType)
        utmCampaign = try values.decodeIfPresent(String.self, forKey: .utmCampaign)
        utmMedium = try values.decodeIfPresent(String.self, forKey: .utmMedium)
        utmSource = try values.decodeIfPresent(String.self, forKey: .utmSource)
        tags = try values.decode([Tag].self, forKey: .tags)
    }
}
