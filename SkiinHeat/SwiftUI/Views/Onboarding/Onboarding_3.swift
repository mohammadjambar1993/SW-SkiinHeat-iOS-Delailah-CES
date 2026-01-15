//
//  Onboarding_3.swift
//  SkiinHeat
//
//  Created by Didier Dorelien on 2019-07-23.
//  Copyright © 2019 Myant. All rights reserved.
//

import SwiftUI
import SkiinBLE

private var MainTimer = Timer()

struct Onboarding_3: View {
    
    @EnvironmentObject var skiinBLE: SkiinBLE
    @EnvironmentObject var onboardingUtils: OnboardingUtils
    @State private var circleScale: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            
            Spacer()
            
            GetNavigationProgress(for: .three)
            
            Text("Insert Pod and Battery into the Wrap")
                .font(
                  Font.custom("Mulish", size: 26)
                    .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .frame(width: 308, height: 65, alignment: .top)
            
            Text("Place the battery into the pocket on the back and place the Pod into the dock on the front.")
              .font(
                Font.custom("Mulish", size: 16)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 274, height: 71, alignment: .top)
            
            Image("podAttachingToBand")
                .resizable()
                .frame(width: 270.48575, height: 208)

            Text("The Pod should click when it is inserted. ")
              .font(
                Font.custom("Mulish", size: 16)
                  .weight(.semibold)
              )
              .multilineTextAlignment(.center)
              .foregroundColor(.black)
              .frame(width: 274, height: 46, alignment: .top)
            
            Button(action: {
                if let sceneDel = UIApplication.shared.windows.first?.windowScene?.delegate as? SceneDelegate {
                    sceneDel.loadDashboard()
                }
            }) {
                HStack {
                    Spacer()
                    Text("Done")
                        .font(.headline).bold()
                        .foregroundColor(Color.white)
                    Spacer()
                }
                .padding(10)
                .background(Color.Heat.primary.clipShape(RoundedRectangle(cornerRadius: 20)))
                .frame(width: 200, alignment: .center)
            }
            
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.top)
    }
}
