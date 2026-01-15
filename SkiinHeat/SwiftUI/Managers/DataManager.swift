//
//  DataManager.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-02.
//  Copyright © 2025 Myant. All rights reserved.
//


import Foundation
import SwiftUI

class DiaryViewModel: ObservableObject {
    @Published var entries: [DiaryEntry] = []
    
    init() {
        loadFromUserDefaults()
    }
    
    func addEntry(entry: DiaryEntry) {
        entries.append(entry)
        saveToUserDefaults()
    }
    
    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
        saveToUserDefaults()
    }
    
    private func loadFromUserDefaults() {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: "diaryEntries"),
           let decoded = try? decoder.decode([DiaryEntry].self, from: data) {
            self.entries = decoded
        }
    }
    
    private func saveToUserDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(entries) {
            UserDefaults.standard.set(encoded, forKey: "diaryEntries")
        }
    }
    
    var sortedEntries: [DiaryEntry] {
            entries.sorted { $0.date > $1.date }
        }
}
