//
//  SymptomDataModel.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-02.
//  Copyright © 2025 Myant. All rights reserved.
//

import SwiftUI

class SymptomDataModel: ObservableObject {
    @Published var items: [String] = [
        "Acne", "Abdominal Cramps", "Back Pain", "Bloating", "Body Aches",
        "Breast Tenderness", "Breast Swelling",
        "Constipation",
        "Low Appetite",
        "Diarrhea",
        "Fatigue",
        "Food Cravings",
        "Headache",
        "Increased Appetite",
        "Insomnia",
        "Irritability",
        "Nausea",
        "Mood Swings",
        "Weight Gain",
        "Weight Loss",
        "Sadness",
    ]
    @Published var selectedItems: Set<String> = []
}
