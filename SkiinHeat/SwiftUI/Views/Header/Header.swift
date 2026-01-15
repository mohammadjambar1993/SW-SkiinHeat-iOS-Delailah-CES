//
//  Header.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2024-12-09.
//  Copyright © 2024 Myant. All rights reserved.
//

import SwiftUI

struct Header<Content: View>: View {
    var headerText: String
    var stackAlignment: HorizontalAlignment
    let content: Content
    var shouldShowBackButton: Bool


    init(headerText: String, stackAlignment: HorizontalAlignment, shouldShowBackButton: Bool,  @ViewBuilder content: () -> Content ) {
        self.content = content()
        self.headerText = headerText
        self.stackAlignment = stackAlignment
        self.shouldShowBackButton = shouldShowBackButton
    }

    @Environment(\.presentationMode) var presentationMode:
        Binding<PresentationMode>

    var body: some View {
        VStack(alignment: stackAlignment, spacing: 0) {
            HStack(alignment: .center) {
                if shouldShowBackButton  {
                    Button(action: { presentationMode.wrappedValue.dismiss() }) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(
                                Color(red: 0.01, green: 0.22, blue: 0.38))
                    }
                }
                Spacer()
                VStack(spacing: 20) {
                    Text(headerText)
                        .font(Font.custom("Mulish", size: 16).weight(.semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(
                            Color(red: 0.01, green: 0.22, blue: 0.38)
                        )
                        .frame(width: 195, alignment: .center)
                    Divider()
                }
            }
            .padding()
            .padding(.top, 1)
            .background(
                GeometryReader { geometry in
                    Color.clear.onAppear {
                        let topSafeAreaHeight = geometry.safeAreaInsets.top
                    }
                })
            content
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
#Preview {
    Header(headerText: "Hello", stackAlignment: .leading, shouldShowBackButton: false) {
        Text("This is the content")
            .padding()
    }
}
