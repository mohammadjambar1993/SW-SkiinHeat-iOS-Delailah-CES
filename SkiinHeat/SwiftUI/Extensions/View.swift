//
//  View.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-10-20.
//  Copyright © 2024 Myant. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func getTag<V>(for view: V) -> Int {
        
        if view is Onboarding {
            print("tag: \(NavigationSource.start.rawValue)")
            return NavigationSource.start.rawValue
        }
        else if self is Onboarding_1 {
            print("tag: \(NavigationSource.one.rawValue)")
            return NavigationSource.one.rawValue
        }
        else if self is Onboarding_2 {
            print("tag: \(NavigationSource.two.rawValue)")
            return NavigationSource.two.rawValue
        }
        else if self is Onboarding_3 {
            print("tag: \(NavigationSource.three.rawValue)")
            return NavigationSource.three.rawValue
        }
        else {
            print("tag default: 0")
            return 0
        }
    }
}
