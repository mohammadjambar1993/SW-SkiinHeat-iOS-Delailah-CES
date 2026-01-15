//
//  KeyboardResponder.swift
//  SkiinHeat
//
//  Created by Kane Denzil Quadras Bernard on 2025-01-04.
//  Copyright © 2025 Myant. All rights reserved.
//

import Combine
import SwiftUI

class KeyboardResponder: ObservableObject {
    @Published var currentHeight: CGFloat = 0

    var keyboardShow: AnyCancellable?
    var keyboardHide: AnyCancellable?

    init() {
        keyboardShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { notification -> CGFloat in
                if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                    return keyboardSize.height
                }
                return 0
            }
            .assign(to: \.currentHeight, on: self)

        keyboardHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ -> CGFloat in
                0
            }
            .assign(to: \.currentHeight, on: self)
    }
}
