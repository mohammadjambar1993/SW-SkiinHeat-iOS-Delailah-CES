//
//  Date.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-02.
//  Copyright © 2025 Myant. All rights reserved.
//

import SwiftUI

func formatDate(_ date: Date) -> String {
       let formatter = DateFormatter()
       formatter.dateFormat = "MMM dd, yyyy" // Custom format
       return formatter.string(from: date)
   }

func formatDateWithSuffix(date: Date) -> String {
    let dayFormatter = DateFormatter()
    dayFormatter.dateFormat = "d"
    let day = Int(dayFormatter.string(from: date))!
    let suffix = daySuffix(from: day)
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMMM yyyy"
    let formattedDate = dateFormatter.string(from: date)
    
    return "\(day)\(suffix) \(formattedDate)"
}

func formatTime(date: Date) -> String {
    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "hh:mm a" // 12-hour format with AM/PM
    return timeFormatter.string(from: date)
}

private func daySuffix(from day: Int) -> String {
    switch day {
    case 1, 21, 31:
        return "st"
    case 2, 22:
        return "nd"
    case 3, 23:
        return "rd"
    default:
        return "th"
    }
}
