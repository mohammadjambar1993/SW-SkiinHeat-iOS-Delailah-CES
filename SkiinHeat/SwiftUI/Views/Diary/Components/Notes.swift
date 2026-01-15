//
//  Notes.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-02.
//  Copyright © 2025 Myant. All rights reserved.
//

import SwiftUI

struct Notes: View {
    @Binding var notesText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Notes")
                .font(
                    Font.custom("Mulish", size: 16)
                        .weight(.semibold)
                )
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
            TextEditor(text: $notesText)
                .frame(width: 343, height: 79)
                .border(Color.gray, width: 1)
                .cornerRadius(3)
        }
    }
}

#Preview {
    Notes(notesText: .constant("HELLODCBFSJDBHFCJSADHBCJAFSDHBCJASHBCJASCJSA"))
}
