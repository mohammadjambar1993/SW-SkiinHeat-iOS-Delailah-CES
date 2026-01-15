//
//  SymptomItem.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-02.
//  Copyright © 2025 Myant. All rights reserved.
//

import Foundation

struct DiaryEntry: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var notes: String
    var symptoms: [String]
}
