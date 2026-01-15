//
//  QuickStartGuide.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-07.
//  Copyright © 2025 Myant. All rights reserved.
//

import SwiftUI

struct QuickStartGuide: View {
    var body: some View {
        Header(headerText: "Quick Start Guide", stackAlignment: .leading, shouldShowBackButton: true){
            ScrollView {
                Image("QuickStart")
                    .resizable()
                    .scaledToFit()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuickStartGuide()
}
