//
//  DiaryCell.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-18.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI

struct DiaryCell: View {
    var date: String
    var time: String
    var symptoms: [String]
    var notes: String
    var onDelete: () -> Void

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(String(describing: date))
                        .font(Font.custom("Mulish", size: 13).weight(.bold))
                        .kerning(1.04)
                        .foregroundColor(
                            Color(red: 0.66, green: 0.2, blue: 0.1)
                        )
                        .frame(maxWidth: .infinity, alignment: .topLeading)

                    Text(String(describing: time))
                        .font(Font.custom("Mulish", size: 13).weight(.bold))
                        .kerning(1.04)
                        .foregroundColor(
                            Color(red: 0.66, green: 0.2, blue: 0.1)
                        )
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                Spacer()
                Button(action: onDelete) {
                    Image("deleteTrash")
                        .frame(width: 24, height: 24)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            Divider()
            VStack(spacing: 0) {
                ForEach(symptoms, id: \.self) { symptom in
                    Text(symptom)
                        .font(Font.custom("Mulish", size: 20).weight(.bold))
                        .kerning(0.1)
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                        .frame(
                            maxWidth: .infinity, minHeight: 30, maxHeight: 30,
                            alignment: .topLeading)
                }

                Text(notes)
                    .font(Font.custom("Mulish", size: 15))
                    .foregroundColor(Color(red: 0.25, green: 0.25, blue: 0.25))
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .inset(by: 0.5)
                .stroke(Color(red: 0.84, green: 0.84, blue: 0.84), lineWidth: 1)
        )
    }
}
#Preview {
    DiaryCell(
        date: formatDateWithSuffix(date: Date()) , time: formatTime(date: Date()),
        symptoms: ["Acne", "Depression"],
        notes:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis p",
        onDelete: {
            print("Delete button tapped.")
        }
    )
}
