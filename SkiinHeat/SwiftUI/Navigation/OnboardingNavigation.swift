//
//  OnbordingNavigator.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-10-20.
//  Copyright © 2024 Myant. All rights reserved.
//

import Foundation
import SwiftUI
import SkiinBLE

private let isDarkTheme = UIApplication.shared.windows.first?.rootViewController?.traitCollection.userInterfaceStyle == .dark

func GetNavigationLink<V: View, BV: View>(for source: Onboarding.NavigationSource, text: String, destination: V, destinationDisabled: Bool = false, back: BV) -> some View {
    
    let destinationColor: Color = destinationDisabled ? Color.Heat.primary.opacity(0.4) : Color.Heat.primary
    let color = source == .start ? Color.white : destinationColor
    return VStack(alignment: .center, spacing: 12) {
        NavigationLink(destination: destination) {
            HStack {
                Spacer()
                Text(text)
                    .font(.headline).bold()
                    .foregroundColor(source == .start ? Color.Heat.primary : Color.white)
                Spacer()
            }
            .padding(10)
            .background(color.clipShape(RoundedRectangle(cornerRadius: 20)))
            .frame(width: 200, alignment: .center)
        }
        .disabled(destinationDisabled)
    }
}


func GetNavigationProgress(for stage: Onboarding.NavigationSource) -> some View {
    
    
    func getGroup(for index: Int) -> some View {
        
        let isPrimary = stage.rawValue >= index
        let color = isPrimary ? Color.Heat.primary : Color.Heat.veryLightPink
        return Group {
            if isPrimary {
                Circle().frame(width: 20, height: 20).foregroundColor(Color.Heat.primary)
            }
            else {
                Circle().frame(width: 20, height: 20).foregroundColor(Color.white)
            }
        }
        .frame(width: 10, height: 10)
        .padding(10)
        .background(color.clipShape(RoundedRectangle(cornerRadius: 40)))
    }
    
    
    return HStack(alignment: .center, spacing: 0) {
        
        getGroup(for: 1)
        
        Spacer().frame(width: 20, height: 2)
            .background(
                stage.rawValue > 1 ? Color.Heat.primary : Color.Heat.veryLightPink
        )
        
        getGroup(for: 2)
        
        Spacer().frame(width: 20, height: 2)
            .background(
                stage.rawValue > 2 ? Color.Heat.primary : Color.Heat.veryLightPink
        )
        
        getGroup(for: 3)
    }
}
