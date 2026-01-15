//
//  Menu.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-05.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 35) {
            Header(headerText: "Menu", stackAlignment: .leading, shouldShowBackButton: true){
                NavigationLink(destination: About()) {
                HStack(alignment: .center) {
                    Text("About")
                        .font(Font.custom("Mulish", size: 16).weight(.semibold))
                        .foregroundColor(
                            Color(red: 0.01, green: 0.22, blue: 0.38))
                    Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(
                                Color(red: 0.01, green: 0.22, blue: 0.38))
                    }
                }.frame(width: 375, height: 70, alignment: .leading)
                Divider()
                NavigationLink(destination: QuickStartGuide()) {
                HStack(alignment: .center) {
                    Text("Quick Start Guide")
                        .font(Font.custom("Mulish", size: 16).weight(.semibold))
                        .foregroundColor(
                            Color(red: 0.01, green: 0.22, blue: 0.38))
                    Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(
                                Color(red: 0.01, green: 0.22, blue: 0.38))
                    }
                }.frame(width: 375, height: 70, alignment: .leading)
                Divider()
                
                HStack(alignment: .center) {
                    Text("FAQ")
                    Spacer()
                        Image("externalLink")
                }
                .foregroundColor(Color(hex: "#033761"))
                .frame(width: 375, height: 70, alignment: .leading)
                .navigationBarBackButtonHidden(true)
                .onTapGesture {
                    openExternalURL(urlString: "https://143647873.fs1.hubspotusercontent-eu1.net/hubfs/143647873/Heat%20Wrap%20FAQ.png")
                }
                Divider()
                
            }
        }.padding()
    }
}

#Preview {
    Menu()
    Spacer()
}
