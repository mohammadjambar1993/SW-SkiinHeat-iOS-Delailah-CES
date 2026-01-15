//
//  DefaultText.swift
//  SkiinHeat
//
//  Created by Didier Dorelien on 2019-07-23.
//  Copyright © 2019 Myant. All rights reserved.
//

import SwiftUI

public struct DefaultText: ViewModifier {
    
    let font: Font
    
    public init(font: Font) {
        self.font = font
    }
    
    public func body(content: Content) -> some View {
        return content
            .font(self.font)
            .foregroundColor(.white)
            .lineLimit(2)
            .multilineTextAlignment(.center)
    }
}
