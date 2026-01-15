//
//  URL.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-02.
//  Copyright © 2025 Myant. All rights reserved.
//

import SwiftUI

func openExternalURL(urlString: String) {
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        return
    }
        // Use UIApplication.shared.open to open the URL if possible
    if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url) { success in
            if success {
                print("The URL was opened")
            } else {
                print("Failed to open URL")
            }
        }
    }
}
