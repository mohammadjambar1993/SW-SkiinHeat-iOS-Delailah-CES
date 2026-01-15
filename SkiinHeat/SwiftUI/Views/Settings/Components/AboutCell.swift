//
//  AboutCell.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-28.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI

struct AboutCell: View {
    var title: String
    var version: String
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            HStack(alignment: .center) {
                Text(title)
                    .font(Font.custom("Mulish", size: 16).weight(.semibold))
                    .foregroundColor(Color(red: 0.01, green: 0.22, blue: 0.38))
            }
            Text(version)
                .font(Font.custom("Mulish", size: 12))
                .foregroundColor(Color(red: 0.41, green: 0.44, blue: 0.46))
        }.padding()
    }
}

#Preview {
    AboutCell(title: "Software Version", version: "0.279.0 (1)")
}
