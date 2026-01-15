//
//  HeatAlertControl.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-07.
//  Copyright © 2025 Myant. All rights reserved.
//

import SwiftUI

struct HeatAlertControl: View {
    @Binding var isPodDisconnected: Bool
//    @Binding var isPodDisconnectedDuringOngoingSession: Bool
//    @Binding var isWrapOverHeated: Bool
    var body: some View {
            HStack(alignment: .top, spacing: 10) {
                Image("bluetoothDisconnectedAlert")
                  .frame(width: 24, height: 24)
                VStack(alignment: .leading, spacing: 20) {
                    Text("Please connect your Heat Wrap to your phone using Bluetooth.")
                      .font(
                        Font.custom("Mulish", size: 16)
                          .weight(.bold)
                      )
                      .kerning(0.08)
                      .foregroundColor(Color(red: 0, green: 0.3, blue: 0.59))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                    Text("HEAT requires your phone to have a Bluetooth connection with the Heat Wrap. ")
                      .font(Font.custom("Mulish", size: 15))
                      .foregroundColor(Color(red: 0, green: 0.3, blue: 0.59))
                      .frame(maxWidth: .infinity, alignment: .topLeading)
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Color(red: 238/255, green: 244/255, blue: 252/255))
    }
}

#Preview {
    HeatAlertControl(isPodDisconnected: .constant(true))
}
