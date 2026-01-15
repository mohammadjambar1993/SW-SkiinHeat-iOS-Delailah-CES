//
//  Onboarding_1.swift
//  SkiinHeat
//
//  Created by Didier Dorelien on 2019-07-22.
//  Copyright © 2019 Myant. All rights reserved.
//

import SwiftUI

struct Onboarding_1: View {
    
    @EnvironmentObject var onboardingUtils: OnboardingUtils
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            
            GetNavigationProgress(for: .one)
            
            Text("Connect Pod to Battery")
              .font(
                Font.custom("Mulish", size: 26)
                  .weight(.bold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 308, height: 32, alignment: .top)
            
            Text("To use your Heat Wrap, connect your Pod to your Battery using the provided cable. ")
              .font(
                Font.custom("Mulish", size: 16)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 274, height: 59, alignment: .top)
            
            Image("podAndBattery")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 256.7287292480469, height: 257.0304260253906)
            .clipped()
            
            GetNavigationLink(for: .one, text: "Continue", destination: Onboarding_2(), back: Onboarding())
            
            Spacer().frame(height: 70)
        }
        
    }
}
