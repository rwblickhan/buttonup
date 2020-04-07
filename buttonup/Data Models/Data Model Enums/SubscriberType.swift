//
//  SubscriberType.swift
//  buttonup
//
//  Created by Russell Blickhan on 3/20/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

@objc enum SubscriberType: Int16 {
    case unknown
    case regular
    case unactivated
    case unpaid
    case removed

    init(apiValue: String) {
        switch apiValue.lowercased() {
        case "regular": self = .regular
        case "unactivated": self = .unactivated
        case "unpaid": self = .unpaid
        case "removed": self = .removed
        default: self = .unknown
        }
    }

    var apiValue: String? {
        switch self {
        case .unknown: return nil
        case .regular: return "regular"
        case .unactivated: return "unactivated"
        case .unpaid: return "unpaid"
        case .removed: return "removed"
        }
    }
}
