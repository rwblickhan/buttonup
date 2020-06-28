//
//  SettingsModel.swift
//  buttonup
//
//  Created by Russell Blickhan on 6/27/20.
//  Copyright © 2020 Russell Blickhan. All rights reserved.
//

import Foundation

struct SettingsModel {
    func save(_ apiKey: String) -> Bool {
        guard !apiKey.isEmpty else { return false }
        // TODO: Switch this to Keychain
        UserDefaults.standard.set(apiKey, forKey: "api_key")
        return true
    }
}
