//
//  DateTimeView.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-09.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI

struct CalendarDateView: View {
    var date: Date

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: date)
    }

    var body: some View {
        HStack {
            Image("calendar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)

            Text(formatDate(date))
                .font(
                    Font.custom("Mulish", size: 16)
                        .weight(.semibold)
                )
                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                .frame(width: 124, height: 23, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .overlay(
            RoundedRectangle(cornerRadius: 3).stroke(
                Color(red: 0.95, green: 0.88, blue: 0.87), lineWidth: 1
            )
            .overlay {

            }
        )
    }
}

// Custom Time View
struct CustomTimeView: View {
    @Binding var date: Date

    private func formatTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"  // Custom format for time
        return formatter.string(from: date)
    }

    var body: some View {
        HStack {
            Image("clock")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)

            Text(formatTime(date))
                .font(
                    Font.custom("Mulish", size: 16)
                        .weight(.semibold)
                )
                .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                .frame(width: 124, height: 23, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .overlay(
            RoundedRectangle(cornerRadius: 3).stroke(
                Color(red: 0.95, green: 0.88, blue: 0.87), lineWidth: 1)
        )
    }
}

struct DateTimeView: View {
    @Binding var selectedDate: Date

    var body: some View {
        VStack(alignment: .leading) {
            Text("Date")
                .font(Font.custom("Mulish", size: 16).weight(.semibold))
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
            CalendarDateView(date: selectedDate)
                .overlay {
                    DatePicker(
                        selection: $selectedDate, displayedComponents: .date
                    ) {}
                    .labelsHidden()
                    .contentShape(Rectangle())
                    .colorMultiply(.clear)
                }
            Text("Time")
                .font(Font.custom("Mulish", size: 16).weight(.semibold))
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .padding(.top, 20)
            CustomTimeView(date: $selectedDate)
                .overlay {
                    DatePicker(
                        selection: $selectedDate,
                        displayedComponents: .hourAndMinute
                    ) {}
                    .labelsHidden()
                    .contentShape(Rectangle())
                    .colorMultiply(.clear)
                }
        }
    }
}
#Preview {
    DateTimeView(selectedDate: .constant(Date()))
}
