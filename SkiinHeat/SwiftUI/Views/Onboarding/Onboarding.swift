//
//  Onboarding.swift
//  SkiinHeat
//
//  Created by Didier Dorelien on 2019-07-18.
//  Copyright © 2019 Myant. All rights reserved.
//

import Combine
import SkiinBLE
import SwiftUI

class OnboardingUtils: ObservableObject {
    @Published var navSelection: Int? = nil

    var cancellable: AnyCancellable? = nil

    init() {
        self.cancellable = self.$navSelection.sink { (newSelection) in
            print("newSelection: \(newSelection)")
        }
    }
}

struct Onboarding: View {

    @EnvironmentObject var skiinBLE: SkiinBLE

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.59, green: 0.09, blue: 0.11)
                    .edgesIgnoringSafeArea(.all)
                /// Main Content
                VStack(
                    alignment: .center, spacing: 23,
                    content: {
                        /// Logo
                        Image("skiinLogoWelcomePage")
                        /// Headline
                        Text("Stay warm with our wire-free heated band.")
                            .frame(height: 50)
                            .modifier(DefaultText(font: .headline))

                        Image("welcomePageGraphics")
                            .padding([.leading, .trailing], 8)
                        /// Divider
                        Divider().frame(height: 2).background(
                            Color.white.clipShape(
                                RoundedRectangle(cornerRadius: 4)))
                        /// Footnote
                        Group {
                            Text("Pair the") + Text(" Pod").bold()
                                + Text(" with the") + Text(" Skiin App").bold()
                                + Text(" to customize the heat settings.")
                        }
                        .font(.subheadline)
                        .frame(height: 50)
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        GetNavigationLink(
                            for: .start, text: "Start Now",
                            destination: Onboarding_1(), back: EmptyView())
                    }
                )
                .padding(70)
            }
            .edgesIgnoringSafeArea(.all)
        }
        .statusBar(hidden: true)
        .accentColor(Color.Heat.primary)

    }

    public enum NavigationSource: Int {
        case start = 0
        case one, two, three
    }

}
