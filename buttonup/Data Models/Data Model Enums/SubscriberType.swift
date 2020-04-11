//
//  SubscriberType.swift
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
    case removed
}
