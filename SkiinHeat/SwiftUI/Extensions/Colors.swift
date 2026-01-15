//
//  Colors.swift
//  SkiinHeat
//
//  Created by Didier Dorelien on 2019-07-23.
//  Copyright © 2019 Myant. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b)
    }
    
    struct Heat {
        static let primary = Color(hex: "#D62228")
        static let veryLightPink = Color(red: 229/255, green: 229/255, blue: 229/255)
        static let flamingo = Color(red: 224/255, green: 88/255, blue: 93/255)
    }
}

