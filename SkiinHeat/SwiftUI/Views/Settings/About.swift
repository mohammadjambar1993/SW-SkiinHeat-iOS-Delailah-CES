//
//  Settings.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-11-28.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI

struct About: View {
    var body: some View {
        VStack(alignment: .leading) {
            Header(headerText: "About", stackAlignment: .leading, shouldShowBackButton: true){
                AboutCell(title: "Software Version", version: "\(Bundle.main.appVersion) (\(Bundle.main.buildVersion))")
                Divider()
                AboutCell(title: "Firmware Version", version: "-")
                Divider()
                AboutCell(title: "Hardware Version", version: "-")
                Divider()
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    About()
}
