//
//  Bundle.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-27.
//  Copyright © 2024 Myant. All rights reserved.
//

import Foundation

extension Bundle {
    // Function to retrieve the app version
    var appVersion: String {
        if let version = self.infoDictionary?["CFBundleShortVersionString"] as? String {
            return version
        }
        return "Unknown"
    }
    
    // Function to retrieve the build number
    var buildVersion: String {
        if let build = self.infoDictionary?["CFBundleVersion"] as? String {
            return build
        }
        return "Unknown"
    }
}
