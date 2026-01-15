//
//  Diary.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-05.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI

struct Diary: View {
    
    @ObservedObject var diaryViewModel = DiaryViewModel()
    @Binding var selectedTab: Int
    var body: some View {
        if diaryViewModel.entries.isEmpty {
            VStack(spacing: 40) {
                ZStack {
                    Rectangle()
                        .foregroundColor(
                            Color(red: 0.93, green: 0.96, blue: 0.98)
                        )
                        .frame(width: 343, height: 88)
                    Text(
                        "You currently have no Symptom Logs saved to your Diary. Would you like to Add a Symptom? "
                    )
                    .font(Font.custom("Mulish", size: 15).weight(.semibold))
                    .kerning(0.45)
                    .foregroundColor(Color(red: 0.27, green: 0.3, blue: 0.33))
                    .frame(width: 291, alignment: .topLeading)
                }
                HStack(alignment: .center, spacing: 4) {
                    Text("Add a Symptom")
                        .font(
                            Font.custom("Mulish", size: 16)
                                .weight(.semibold)
                        )
                        .kerning(0.16)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .onTapGesture {
                            selectedTab = 1
                        }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .frame(height: 43, alignment: .center)
                .background(Color(red: 0.92, green: 0.37, blue: 0.15))
                .cornerRadius(30)
            }
        } else {
            List {
                ForEach(diaryViewModel.sortedEntries) { entry in
                    DiaryCell(
                        date: formatDateWithSuffix(date: entry.date) , time: formatTime(date: entry.date),
                        symptoms: entry.symptoms, notes: entry.notes
                    ) {
                        if let index = diaryViewModel.entries.firstIndex(
                            where: { $0.id == entry.id })
                        {
                            diaryViewModel.deleteEntry(
                                at: IndexSet(integer: index))
                        }
                    }.padding(.vertical, 8)
                }
                .onDelete { offsets in
                    diaryViewModel.deleteEntry(at: offsets)
                }
            }
        }
    }
}

#Preview {
    Diary(selectedTab: .constant(1))
}
